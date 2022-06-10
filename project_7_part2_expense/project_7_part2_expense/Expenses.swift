//
//  Expenses.swift
//  project_7_part2_expense
//
//  Created by Ujjwal Baskota on 3/28/22.
//

import Foundation

class Expenses: ObservableObject {
	@Published var items = [ExpenseItem]() {
		didSet {
			let encoder = JSONEncoder()
			
			if let encoded = try? encoder.encode(items) {
				UserDefaults.standard.set(encoded, forKey: "Items")
			}
		}
	}
	init() {
		if let savedItems = UserDefaults.standard.data(forKey: "Items") {
			if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
				items = decodedItems
				return
			}
		}
		items = []
	}
	
}
