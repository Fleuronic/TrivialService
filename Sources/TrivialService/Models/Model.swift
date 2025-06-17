//
//  File.swift
//  TrivialService
//
//  Created by Jordan Kay on 5/25/25.
//

import Schemata
import struct Trivial.Answer

extension Array: AnyModel where Element: Model {
	public static var anySchema: AnySchema {
		.init(schema)
	}
}

extension Array: Model where Element: Model {
	public static var schema: Schema<Self> {
		if let type = self as? [Answer.Identified].Type {
			return type.schema as! Schema<Self>
		}

		fatalError()
	}
}
