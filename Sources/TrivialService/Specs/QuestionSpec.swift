// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Trivial.Category
import protocol Catena.Scoped

public protocol QuestionSpec {
	associatedtype QuestionList: Scoped<QuestionListFields>
	associatedtype QuestionFetch: Scoped<QuestionFetchFields>

	associatedtype QuestionListFields: QuestionFields
	associatedtype QuestionFetchFields: QuestionFields

	func listQuestions(of type: Question.QuestionType?, inCategoryWith categoryID: Category.ID?, with difficulty: Question.Difficulty?, count: Int?) async -> QuestionList
	func fetchRandomQuestion(of type: Question.QuestionType?, inCategoryWith categoryID: Category.ID?, with difficulty: Question.Difficulty?) async -> QuestionFetch
}
