//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ujjwal Baskota on 6/7/22.
//

import SwiftUI

struct ContentView: View {
	
	@StateObject var classOrder = ClassOrder()
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					Picker("Select your cake type ", selection: $classOrder.order.type) {
						ForEach(Order.types.indices) {
							Text(Order.types[$0])
						}
					}
					
					Stepper("Number of cakes: \(classOrder.order.quantity)", value: $classOrder.order.quantity, in: 3...20)
				}
				
				Section {
					Toggle("Any special requests ?", isOn: $classOrder.order.specialRequestEnabled.animation())
					
					if classOrder.order.specialRequestEnabled {
						Toggle("Add extra frosting", isOn: $classOrder.order.extraFrosting)
						Toggle("Add extra sprinkles", isOn: $classOrder.order.addSprinkles)
					}
				}
				Section {
					NavigationLink {
						AddressView(classOrder: classOrder)
					} label: {
						Text("Delivery Details")
					}
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
