// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit

import struct Trivial.Question
import protocol Catena.Scoped

public protocol QuestionSpec {
	associatedtype QuestionFetch: Scoped<QuestionFetchFields>

	associatedtype QuestionFetchFields: QuestionFields

	func fetchQuestions(of type: Question.QuestionType?, in category: Int?, with difficulty: Question.Difficulty?, count: Int?) async -> QuestionFetch
}
