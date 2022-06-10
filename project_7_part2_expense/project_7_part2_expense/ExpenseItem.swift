//
//  ExpenseItem.swift
//  project_7_part2_expense
//
//  Created by Ujjwal Baskota on 3/28/22.
//

import Foundation


struct ExpenseItem: Identifiable, Codable {
	var id =  UUID()
	let name: String
	let type: String
	let amount: Double
	let currency: String
}
