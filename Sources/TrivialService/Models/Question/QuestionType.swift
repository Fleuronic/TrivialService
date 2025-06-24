// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Trivial.Question

public extension Question.QuestionType {
	var encoded: String {
		let path: Path = switch self {
		case .multipleChoice: .multipleChoice
		case .trueFalse: .trueFalse
		}

		return path.rawValue
	}

	static func decoded(_ value: String) -> Self {
		switch Path(rawValue: value)! {
		case .multipleChoice: .multipleChoice
		case .trueFalse: .trueFalse
		}
	}
}

// MARK: -
extension Question.QuestionType: Schemata.ModelValue {
	// MARK: ModelValue
	public static var value: Value<String, Self> {
		String.value.bimap(
			decode: decoded,
			encode: \.encoded
		)
	}
}

// MARK: -
private extension Question.QuestionType {
	enum Path: String {
		case multipleChoice = "multiple"
		case trueFalse = "boolean"
	}
}
