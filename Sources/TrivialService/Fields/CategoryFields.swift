// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Category
import struct Catena.IDFields
import protocol Catena.Fields

public protocol CategoryFields: Fields where Model == Category.Identified {}

// MARK: -
extension IDFields: CategoryFields where Model == Category.Identified {}
