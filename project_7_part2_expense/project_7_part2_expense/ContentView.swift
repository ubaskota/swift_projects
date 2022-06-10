//
//  ContentView.swift
//  project_7_part2_expense
//
//  Created by Ujjwal Baskota on 3/28/22.
//

import SwiftUI

struct ContentView: View {
//	@StateObject var expenses = Expenses()
	@State private var showingAddExpense = false
	@State private var selection: String? = nil
	
    var body: some View {
		
		NavigationView {
			VStack (spacing: 30) {
				List {
					NavigationLink("Business", destination: BusinessView())
					NavigationLink("Personal", destination: PersonalView())
				}
			}
		}
	}
}


struct BusinessView: View {
	
	@StateObject var business_expenses = Expenses()
	@State private var showingAddExpense = false
	
	var body: some View {
		NavigationView {
			List {
				ForEach(business_expenses.items) { item in
					HStack {
						VStack(alignment: .leading) {
							Text(item.name)
								.font(.headline)
							Text(item.type)
						}
						
						Spacer()
						
						if item.amount < 10 {
							Text(item.amount, format: .currency(code: item.currency))
								.background(Color.green)
								.padding()
						}
						
						else if item.amount < 100 {
							Text(item.amount, format: .currency(code: item.currency))
								.background(Color.blue)
								.padding()
						}
						else {
							Text(item.amount, format: .currency(code: item.currency))
								.background(Color.red)
								.padding()
						}
					}
				}
				.onDelete(perform: removeItems)
			}
			.navigationTitle("iExpense")
			.toolbar {
				Button {
					showingAddExpense = true
//					let expense = ExpenseItem(name: "Test", type: "Business", amount: 5, currency: "USD")
//					business_expenses.items.append(expense)
			} label : {
				Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $showingAddExpense) {
				AddView(personal_expenses: business_expenses, business_expenses: business_expenses)
			}
		}
//		NavigationView {
//			VStack {
//				Text("Hello")
//			}
//		}
	}
	
	func removeItems(at offsets: IndexSet) {
		business_expenses.items.remove(atOffsets: offsets)
	}
	
}


struct PersonalView: View {
	
	@StateObject var personal_expenses = Expenses()
	@State private var showingAddExpense = false
	
	var body: some View {
		NavigationView {
			List {
				ForEach(personal_expenses.items) { item in
					HStack {
						VStack(alignment: .leading) {
							Text(item.name)
								.font(.headline)
							Text(item.type)
						}
						
						Spacer()
						
						if item.amount < 10 {
							Text(item.amount, format: .currency(code: item.currency))
								.background(Color.green)
								.padding()
						}
						
						else if item.amount < 100 {
							Text(item.amount, format: .currency(code: item.currency))
								.background(Color.blue)
								.padding()
						}
						else {
							Text(item.amount, format: .currency(code: item.currency))
								.background(Color.red)
								.padding()
						}
					}
				}
				.onDelete(perform: removeItems)
			}
			.navigationTitle("iExpense")
			.toolbar {
				Button {
					showingAddExpense = true
//					let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5, currency: "USD")
//					personal_expenses.items.append(expense)
			} label : {
				Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $showingAddExpense) {
				AddView(personal_expenses: personal_expenses, business_expenses: personal_expenses)
			}
		}
//		NavigationView {
//			VStack {
//				Text("Hello")
//			}
//		}
	}
	
	func removeItems(at offsets: IndexSet) {
		personal_expenses.items.remove(atOffsets: offsets)
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
			.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
