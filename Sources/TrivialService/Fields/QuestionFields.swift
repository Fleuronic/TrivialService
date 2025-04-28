// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Catena.ImpossibleFields
import protocol Catena.Valued
import protocol Catena.Fields

public protocol QuestionFields: Fields {
	associatedtype Model: Valued<Question> = Question
}
