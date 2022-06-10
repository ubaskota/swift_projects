//
//  order.swift
//  CupcakeCorner
//
//  Created by Ujjwal Baskota on 6/7/22.
//

import SwiftUI
import Foundation


class ClassOrder : ObservableObject {
	@Published var order : Order
	
	init() {
		order = Order()
	}
}


struct Order : Codable {
	
	enum CodingKeys: CodingKey {
		case type, quantity, extraFrosting, addSprinkles, name, streetAdress, city, zip
	}
	
	init() {}
	
	
	static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
	
	var type = 0
	var quantity = 3
	
	var extraFrosting = false
	var addSprinkles = false
	
	var name = ""
	var streetAddress = ""
	var city = ""
	var zip = ""
	
	
	var specialRequestEnabled = false {
		didSet {
			if specialRequestEnabled == false {
				extraFrosting = false
				addSprinkles = false
			}
		}
	}
	
	
	var hasValidAddress: Bool {
		if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
			return true
		}
		
		else if name.hasPrefix(" ") || streetAddress.hasPrefix(" ") || city.hasPrefix(" ") || zip.hasPrefix(" ") {
			return true
		}
		return false
	}

	
	var cost: Double {
		var cost = Double(quantity) * 2
		
		cost += (Double(type) / 2)
		
		if extraFrosting {
			cost += Double(quantity) / 2
		}
		
		return cost
	}
	
		func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)

			try container.encode(type, forKey: .type)
			try container.encode(quantity, forKey: .quantity)

			try container.encode(extraFrosting, forKey: .extraFrosting)
			try container.encode(addSprinkles, forKey: .addSprinkles)

			try container.encode(name, forKey: .name)
			try container.encode(streetAddress, forKey: .streetAdress)
			try container.encode(city, forKey: .city)
			try container.encode(zip, forKey: .zip)
		}


		init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)

			type = try container.decode(Int.self,forKey: .type)
			quantity = try container.decode(Int.self,forKey: .quantity)

			extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
			addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)

			name = try container.decode(String.self, forKey: .name)
			streetAddress = try container.decode(String.self, forKey: .streetAdress)
			city = try container.decode(String.self, forKey: .city)
			zip = try container.decode(String.self, forKey: .zip)
		}
	
}





//class Order:ObservableObject, Codable {
//
//	enum CodingKeys: CodingKey {
//		case type, quantity, extraFrosting, addSprinkles, name, streetAdress, city, zip
//	}
//
//	static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
//
//	@Published var type = 0
//	@Published var quantity = 3
//
//	@Published var specialRequestEnabled = false {
//		didSet {
//			if specialRequestEnabled == false {
//				extraFrosting = false
//				addSprinkles = false
//			}
//		}
//	}
//	@Published var extraFrosting = false
//	@Published var addSprinkles = false
//
//	@Published var name = ""
//	@Published var streetAddress = ""
//	@Published var city = ""
//	@Published var zip = ""
//
//	var hasValidAddress: Bool {
//		if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
//			return true
//		}
//
//		else if name.hasPrefix(" ") || streetAddress.hasPrefix(" ") || city.hasPrefix(" ") || zip.hasPrefix(" ") {
//			return true
//		}
//		return false
//	}
//
//	var cost: Double {
//		var cost = Double(quantity) * 2
//
//		cost += (Double(type) / 2)
//
//		if extraFrosting {
//			cost += Double(quantity) / 2
//		}
//
//		return cost
//	}
//
//	init() {}
//
//
//	func encode(to encoder: Encoder) throws {
//		var container = encoder.container(keyedBy: CodingKeys.self)
//
//		try container.encode(type, forKey: .type)
//		try container.encode(quantity, forKey: .quantity)
//
//		try container.encode(extraFrosting, forKey: .extraFrosting)
//		try container.encode(addSprinkles, forKey: .addSprinkles)
//
//		try container.encode(name, forKey: .name)
//		try container.encode(streetAddress, forKey: .streetAdress)
//		try container.encode(city, forKey: .city)
//		try container.encode(zip, forKey: .zip)
//	}
//
//
//	required init(from decoder: Decoder) throws {
//		let container = try decoder.container(keyedBy: CodingKeys.self)
//
//		type = try container.decode(Int.self,forKey: .type)
//		quantity = try container.decode(Int.self,forKey: .quantity)
//
//		extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//		addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//
//		name = try container.decode(String.self, forKey: .name)
//		streetAddress = try container.decode(String.self, forKey: .streetAdress)
//		city = try container.decode(String.self, forKey: .city)
//		zip = try container.decode(String.self, forKey: .zip)
//	}
//}
