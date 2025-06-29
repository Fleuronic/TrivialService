// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Catena.IDFields
import protocol Catena.Fields

public protocol QuestionFields: Fields where Model == Question.Identified {}

// MARK: -
extension IDFields: QuestionFields where Model == Question.Identified {}
