// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Category
import protocol Catena.Scoped

public protocol CategorySpec {
	associatedtype CategoryList: Scoped<CategoryListFields>

	associatedtype CategoryListFields: CategoryFields

	func listCategories() async -> CategoryList
}
