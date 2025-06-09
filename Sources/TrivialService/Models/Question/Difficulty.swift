// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Trivial.Question

public extension Question.Difficulty {
	var encoded: String {
		let key: Path = switch self {
		case .easy: .easy
		case .medium: .medium
		case .hard: .hard
		}

		return key.rawValue
	}

	static func decoded(_ value: String) -> Self {
		switch Path(rawValue: value)! {
		case .easy: .easy
		case .medium: .medium
		case .hard: .hard
		}
	}
}

// MARK: -
extension Question.Difficulty: Schemata.ModelValue {
	public static var value: Value<String, Self> {
		String.value.bimap(
			decode: decoded,
			encode: \.encoded
		)
	}
}

// MARK: -
private extension Question.Difficulty {
	private enum Path: String {
		case easy
		case medium
		case hard
	}
}
