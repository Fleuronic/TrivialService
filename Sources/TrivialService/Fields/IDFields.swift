// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Trivial.Answer
import struct Trivial.Category
import struct Catena.IDFields
import struct Identity.Identifier

extension IDFields: TrivialService.QuestionFields where Model == Question.Identified {}
extension IDFields: TrivialService.AnswerFields where Model == Answer.Identified {}
extension IDFields: TrivialService.CategoryFields where Model == Category.Identified {}

extension IDFields: Swift.Decodable where Model.ID: Decodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		try self.init(id: container.decode(Model.ID.self, forKey: .id))
	}
}

// MARK: -
private extension IDFields {
	enum CodingKeys: String, CodingKey {
		case id
	}
}
