// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Identity.Identifier
import protocol Catena.StringEncodable

extension Identifier: Schemata.AnyModelValue where Value.RawIdentifier: ModelValue & StringEncodable {
	public static var anyValue: AnyValue {
		.init(
			String.value.bimap(
				decode: { Self(rawValue: Value.RawIdentifier.encode(with: $0)) },
				encode: \.description
			)
		)
	}
}

// MARK: -
extension Identifier: Schemata.ModelValue where Value.RawIdentifier: ModelValue & StringEncodable {
	public static var value: Schemata.Value<Value.RawIdentifier.Encoded, Self> {
		Value.RawIdentifier.value.bimap(
			decode: Self.init,
			encode: \.rawValue
		)
	}
}
