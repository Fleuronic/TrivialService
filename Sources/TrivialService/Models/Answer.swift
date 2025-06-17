// Copyright © Fleuronic LLC. All rights reserved.

import Identity
import Schemata
import struct Trivial.Answer
import struct Trivial.Question
import struct Foundation.UUID
import struct Catena.IDFields
import protocol Catena.Valued

public extension Answer {
	typealias ID = Identified.ID
	typealias IDFields = Catena.IDFields<Identified>
	typealias Identified = IdentifiedAnswer
}

// MARK: -
public struct IdentifiedAnswer: Sendable {
	public let id: Answer.ID
	public let value: Answer
	public let question: Question.Identified
}

// MARK: -
extension Answer.Identified: Identifiable {
	// MARK: Identifiable
	public typealias RawIdentifier = UUID
}

extension Answer.Identified: Valued {
	// MARK: Valued
	public typealias Value = Answer
}

extension Answer.Identified: Model {
	// MARK: Model
	public enum Path: String, CodingKey {
		case text
		case isCorrect = "correct"
		case question
	}

	public static let schema = Schema(
		Self.init,
		\.id * .id,
		\.value.text * .text,
		\.value.isCorrect * .isCorrect,
		\.question --> .question
	)

	public static let schemaName = "answers"
}

// MARK: -
public extension [Answer] {
	var text: [String] { map(\.text) }
	var isCorrect: [Bool] { map(\.isCorrect) }
}

// MARK: -
public extension [Answer.Identified] {
	var id: [Answer.ID] { map(\.id) }
	var value: [Answer] { map(\.value) }

	init(
		ids: [Answer.ID],
		texts: [String],
		isCorrectFlags: [Bool]
	) {
		let questions: [Question.Identified] = []
		self = ids.enumerated().map { index, id in
			.init(
				id: id,
				text: texts[index],
				isCorrect: isCorrectFlags[index],
				question: questions[index]
			)
		}
	}

	// MARK: Model
	static let schema = Schema<Self>(
		Self.init,
		\.id * .id,
		\.value.text * .text,
		\.value.isCorrect * .isCorrect
	)
}

// MARK: -
private extension Answer.Identified {
	init(
		id: Answer.ID,
		text: String,
		isCorrect: Bool,
		question: Question.Identified
	) {
		self.init(
			id: id,
			value: .init(
				text: text,
				isCorrect: isCorrect
			),
			question: question
		)
	}
}
