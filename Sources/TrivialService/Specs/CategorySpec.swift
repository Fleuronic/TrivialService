// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catena.Scoped

public protocol CategorySpec {
	associatedtype CategoryList: Scoped<CategoryListFields>

	associatedtype CategoryListFields: CategoryFields

	func listCategories() async -> CategoryList
}
