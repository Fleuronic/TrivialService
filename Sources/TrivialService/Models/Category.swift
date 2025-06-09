// Copyright © Fleuronic LLC. All rights reserved.

import Identity
import Schemata
import struct Trivial.Category
import struct Trivial.Answer
import struct Foundation.UUID
import struct Catena.IDFields
import protocol Catena.Valued

public extension Category {
	typealias ID = Identified.ID
	typealias IDFields = Catena.IDFields<Identified>
	typealias Identified = IdentifiedCategory
}

// MARK: -
public final class IdentifiedCategory: Sendable {
	public let id: Category.ID
	public let value: Category
	public let parent: Category.Identified!

	private init(
		id: Category.ID,
		value: Category,
		parent: Category.Identified?
	) {
		self.id = id
		self.value = value
		self.parent = parent
	}
}

// MARK: -
extension Category.Identified: Identifiable {
	// MARK: Identifiable
	public typealias RawIdentifier = UUID
}

extension Category.Identified: Valued {
	// MARK: Valued
	public typealias Value = Category
}

extension Category.Identified: Schemata.Model {
	// MARK: Model
	public enum Path: String, CodingKey {
		case name
		case parent
	}

	public static let schema = Schema(
		Category.Identified.init,
		\.id * .id,
		\.value.name * .name,
		\.parent -?> .parent
	)

	public static let schemaName = "categories"
}

// MARK: -
private extension Category.Identified {
	convenience init(
		id: Category.ID,
		name: String,
		parent: Category.Identified?
	) {
		self.init(
			id: id,
			value: .init(name: name),
			parent: parent
		)
	}
}
