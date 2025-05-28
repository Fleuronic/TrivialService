// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Category
import protocol Catena.Fields
import protocol Catena.Valued

public protocol CategoryFields: Fields {
	associatedtype Model: Valued<Category> = Category.Identified
}
