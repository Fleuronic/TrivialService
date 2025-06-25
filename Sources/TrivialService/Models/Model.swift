// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Trivial.Answer

extension Array: Schemata.AnyModel where Element: Model {
	public static var anySchema: AnySchema {
		.init(schema)
	}
}

extension Array: Schemata.Model where Element: Model {
	public static var schema: Schema<Self> {
		if let type = self as? [Answer.Identified].Type {
			return type.schema as! Schema<Self>
		}

		fatalError()
	}
}
