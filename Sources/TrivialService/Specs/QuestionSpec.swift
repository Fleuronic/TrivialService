// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Trivial.Category
import protocol Catena.Scoped

public protocol QuestionSpec {
	associatedtype QuestionList: Scoped<QuestionListFields>

	associatedtype QuestionListFields: QuestionFields

	func listQuestions(of type: Question.QuestionType?, inCategoryWith categoryID: Category.ID?, with difficulty: Question.Difficulty?, count: Int?) async -> QuestionList
}
