// Copyright © Fleuronic LLC. All rights reserved.

import Identity
import Schemata
import struct Trivial.Question
import struct Trivial.Category
import struct Trivial.Answer
import struct Catena.IDFields
import struct Foundation.UUID
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
extension Question.Identified: Identifiable {
	// MARK: Identifiable
	public typealias RawIdentifier = UUID
}

extension Question.Identified: Valued {
	// MARK: Valued
	public typealias Value = Question
}

extension Question.Identified: Schemata.Model {
	// MARK: Model
	public enum Path: String, CodingKey {
		case question // TODO
		case prompt
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
