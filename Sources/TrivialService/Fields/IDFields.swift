// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Trivial.Answer
import struct Trivial.Category
import struct Catena.IDFields
import struct Identity.Identifier

extension IDFields: TrivialService.QuestionFields where Model == Question.Identified {}
extension IDFields: TrivialService.AnswerFields where Model == Answer.Identified {}
extension IDFields: TrivialService.CategoryFields where Model == Category.Identified {}
