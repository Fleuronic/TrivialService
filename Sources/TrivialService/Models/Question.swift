//
//  File.swift
//  TrivialService
//
//  Created by Jordan Kay on 4/27/25.
//

import struct Trivial.Question
import protocol Catena.Valued

extension Question: Catena.Valued {
	public typealias Value = Self
}
