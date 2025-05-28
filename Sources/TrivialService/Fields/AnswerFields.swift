// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Answer
import protocol Catena.Fields
import protocol Catena.Valued

public protocol AnswerFields: Fields {
	associatedtype Model: Valued<Answer> = Answer.Identified
}
