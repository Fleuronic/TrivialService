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
public struct IdentifiedCategory: Sendable {
	public let id: Category.ID
	public let parentID: Category.ID!
	public let value: Category
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
		case parentID = "parent_id"
	}

	public static let schema = Schema(
		Self.init,
		\.id * .id,
		\.parentID * .parentID,
		\.value.name * .name
	)

	public static let schemaName = "categories"
}

// MARK: -
private extension Category.Identified {
	init(
		id: Category.ID,
		parentID: Category.ID?,
		name: String
	) {
		self.init(
			id: id,
			parentID: parentID,
			value: .init(name: name)
		)
	}
}
