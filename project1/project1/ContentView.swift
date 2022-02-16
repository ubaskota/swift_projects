//
//  ContentView.swift
//  project1
//
//  Created by Ujjwal Baskota on 5/18/21.
//

import SwiftUI

struct ContentView: View {
	
	@State private var checkAmount = ""
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 2
	
	@State var tipPercentages = [10, 15, 20, 25]
	
	var totalPerPerson: (Double, Double) {
		let peopleCount = Double(numberOfPeople + 2)
		let tipSelection = Double(tipPercentages[tipPercentage])
		let orderAmount = Double(checkAmount) ?? 0
		let tipValue = orderAmount/100 * tipSelection
		let grandTotal = orderAmount + tipValue
		let amountPerPerson = grandTotal / peopleCount
		
		return (amountPerPerson, grandTotal)
	}
	
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Amount", text: $checkAmount)
						.keyboardType(.decimalPad)
				}
			
				Picker("Number of People", selection : $numberOfPeople) {
					ForEach(2 ..< 100) {
						Text("\($0) people")
					}
				}
				
				Section(header: Text("How much tip do you want to leave?")) {
					Picker("Tip Percentage", selection: $tipPercentage) {
						ForEach(0 ..< tipPercentages.count) {
							Text("\(self.tipPercentages[$0])%")
						}
					}
					.pickerStyle(SegmentedPickerStyle())
				}
				
				Section(header: Text("AMount per person")) {
					Text("$\(totalPerPerson.0, specifier: "%.2f")")
				}
				
				Section(header: Text("Total Amount")) {
					Text("$\(totalPerPerson.1, specifier: "%.2f")")
				}
			.navigationBarTitle("WeSplit")
			}
		}
		.foregroundColor(tipPercentage == 0 ? .red : .blue)
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
		
    }
}
