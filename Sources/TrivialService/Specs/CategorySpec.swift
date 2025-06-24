// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Category
import protocol Catena.Scoped
import protocol Catena.ResultProviding
import protocol Catenoid.Storage
import protocol Catenoid.Fields

public protocol CategorySpec {
	associatedtype CategoryList: Scoped<CategoryListFields>

	associatedtype CategoryListFields: CategoryFields

	func listCategories() async -> CategoryList
}

// MARK: -
public extension CategorySpec where
	Self: Storage & ResultProviding,
	Error == StorageError,
	CategoryListFields: Fields<Category.Identified> & Decodable {
	func listCategories() async -> Results<CategoryListFields> {
		await fetch()
	}
}
