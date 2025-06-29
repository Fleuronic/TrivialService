// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Answer
import struct Catena.IDFields
import protocol Catena.Fields

public protocol AnswerFields: Fields where Model == Answer.Identified {}

// MARK: -
extension IDFields: AnswerFields where Model == Answer.Identified {}
