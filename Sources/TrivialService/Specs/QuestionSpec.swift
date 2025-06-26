// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Trivial.Category
import protocol Catena.Scoped
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol Caesura.Storage

public protocol QuestionSpec {
	associatedtype QuestionFetch: Scoped<QuestionFetchFields>
	associatedtype QuestionList: Scoped<QuestionListFields>

	associatedtype QuestionFetchFields: QuestionFields
	associatedtype QuestionListFields: QuestionFields

	func fetchQuestion(with id: Question.ID) async -> QuestionFetch
	func listQuestions(of type: Question.QuestionType?, inCategoryWith categoryID: Category.ID?, with difficulty: Question.Difficulty?) async -> QuestionList
}

// MARK: -
public extension QuestionSpec where
	Self: Storage & ResultProviding,
	Error == StorageError,
	QuestionFetchFields: Fields<Question.Identified> & Decodable,
	QuestionListFields: Fields<Question.Identified> & Decodable {
	func fetchQuestion(with id: Question.ID) async -> SingleResult<QuestionFetchFields> {
		await fetch(with: id)
	}

	func listQuestions(of type: Question.QuestionType? = nil, inCategoryWith categoryID: Category.ID? = nil, with difficulty: Question.Difficulty? = nil) async -> Results<QuestionListFields> {
		await fetch(
			where: Question.Identified.predicate(
				type: type,
				categoryID: categoryID,
				difficulty: difficulty
			)
		)
	}
}
