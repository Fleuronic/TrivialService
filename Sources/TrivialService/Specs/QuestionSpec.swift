// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit

import struct Trivial.Question
import protocol Catena.Scoped

public protocol QuestionSpec {
	associatedtype QuestionFetch: Scoped<QuestionFetchFields>

	associatedtype QuestionFetchFields: QuestionFields

	func fetchQuestions(of type: String?, in category: Int?, count: Int?) async -> QuestionFetch
}
