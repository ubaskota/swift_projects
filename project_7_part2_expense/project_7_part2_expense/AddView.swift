//
//  AddView.swift
//  project_7_part2_expense
//
//  Created by Ujjwal Baskota on 3/28/22.
//

import SwiftUI

struct AddView: View {
	@ObservedObject var personal_expenses: Expenses
	@ObservedObject var business_expenses: Expenses
	@Environment(\.dismiss) var dismiss
	
	@State private var name = ""
	@State private var type = ""
	@State private var amount = 0.0
	@State private var currency_type = ""
	
	let types = ["Business", "Personal"]
	let currencies = Locale.isoCurrencyCodes
	
	
    var body: some View {
		NavigationView {
			Form {
				TextField("Name", text: $name)
				
				Picker("Type", selection: $type) {
					ForEach(types, id: \.self) {
						Text($0)
					}
				}
				
				Picker("Currency", selection: $currency_type) {
					ForEach(currencies, id: \.self) {
						Text($0)
					}
				}
				
				TextField("Amoount", value: $amount, format: .currency(code: currency_type))
					.keyboardType(.decimalPad)
			}
			.navigationTitle("Add new expense")
			.toolbar {
				Button("Save") {
					let item = ExpenseItem(name: name, type: type, amount: amount, currency: currency_type)
					if type == "Personal" {
						personal_expenses.items.append(item)
					}
					else {
						business_expenses.items.append(item)
					}
//					expenses.items.append(item)
					dismiss()
				}
			}
		}
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
		AddView(personal_expenses: Expenses(), business_expenses: Expenses())
    }
}
