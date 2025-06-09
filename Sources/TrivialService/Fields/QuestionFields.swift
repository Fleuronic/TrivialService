// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import protocol Catena.Fields
import protocol Catena.Valued

public protocol QuestionFields: Fields {
	associatedtype Model: Valued<Question> = Question.Identified
}
