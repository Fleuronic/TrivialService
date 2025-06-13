// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Answer
import protocol Catena.Fields

public protocol AnswerFields: Fields where Model == Answer.Identified {}
