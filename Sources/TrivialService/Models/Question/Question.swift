// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import PersistDB
import Catenoid
import Identity
import struct Trivial.Question
import struct Trivial.Category
import struct Trivial.Answer
import struct Foundation.UUID
import struct Catena.IDFields
import protocol Catena.Valued

public extension Question {
	typealias ID = Identified.ID
	typealias IDFields = Catena.IDFields<Identified>
	typealias Identified = IdentifiedQuestion
}

// MARK: -
public struct IdentifiedQuestion: Sendable {
	public let id: Question.ID
	public let value: Question
	public let category: Category.Identified
	public let answers: [Answer.Identified]
}

// MARK: -
extension Question.Identified {
	static func predicate(
		type: Question.QuestionType?,
		categoryID: Category.ID?,
		difficulty: Question.Difficulty?
	) -> Predicate<Self>? {
		var predicate: Predicate<Self>?

		if let type {
			predicate = \.value.questionType == type
		}

		if let categoryID {
			let subpredicate: Predicate<Self> = \.category.id == categoryID
			predicate = predicate.map { $0 && subpredicate } ?? subpredicate
		}

		if let difficulty {
			let subpredicate: Predicate<Self> = \.value.difficulty == difficulty
			predicate = predicate.map { $0 && subpredicate } ?? subpredicate
		}

		return predicate
	}
}

// MARK: -
extension Question.Identified: Identifiable {
	// MARK: Identifiable
	public typealias RawIdentifier = UUID
}

extension Question.Identified: Valued {
	// MARK: Valued
	public typealias Value = Question
}

extension Question.Identified: PersistDB.Model {
	// MARK: Model
	public enum Path: String, CodingKey {
		case prompt
		case question
		case questionType = "type"
		case difficulty
		case answers
		case category
	}

	public static let schema = Schema(
		Self.init,
		\.id * .id,
		\.value.prompt * .prompt,
		\.value.questionType * .questionType,
		\.value.difficulty * .difficulty,
		\.category --> .category,
		\.answers <<- \.question
	)

	public static let schemaName = "questions"

	// MARK: Model
	public static var defaultOrder: [Ordering<Self>] {
		[.init(\.value.prompt, ascending: true)]
	}
}

// MARK: -
private extension Question.Identified {
	init(
		id: Question.ID,
		prompt: String,
		questionType: Question.QuestionType,
		difficulty: Question.Difficulty,
		category: Category.Identified,
		answers: [Answer.Identified]
	) {
		self.init(
			id: id,
			value: .init(
				prompt: prompt,
				questionType: questionType,
				difficulty: difficulty
			),
			category: category,
			answers: answers
		)
	}
}
