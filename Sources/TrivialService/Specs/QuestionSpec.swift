// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Trivial.Category
import protocol Catena.Scoped

public protocol QuestionSpec {
	associatedtype QuestionFetch: Scoped<QuestionFetchFields>
	associatedtype QuestionList: Scoped<QuestionListFields>

	associatedtype QuestionFetchFields: QuestionFields
	associatedtype QuestionListFields: QuestionFields

	func fetchQuestion(with id: Question.ID) async -> QuestionFetch
	func listQuestions(of type: Question.QuestionType?, inCategoryWith categoryID: Category.ID?, with difficulty: Question.Difficulty?, count: Int?) async -> QuestionList
}
