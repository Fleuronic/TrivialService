// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Trivial.Question

public extension Question.QuestionType {
	enum Key: String {
		case multipleChoice = "multiple"
		case trueFalse = "boolean"
	}

	var encoded: String {
		let key: Key = switch self {
		case .multipleChoice: .multipleChoice
		case .trueFalse: .trueFalse
		}

		return key.rawValue
	}

	static func decoded(_ value: String) -> Self {
		switch Key(rawValue: value)! {
		case .multipleChoice: .multipleChoice
		case .trueFalse: .trueFalse
		}
	}
}

// MARK: -
extension Question.QuestionType: Schemata.ModelValue {
	public static var value: Value<String, Self> {
		String.value.bimap(
			decode: decoded,
			encode: \.encoded
		)
	}
}
