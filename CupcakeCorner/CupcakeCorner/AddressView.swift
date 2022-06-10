//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Ujjwal Baskota on 6/7/22.
//

import SwiftUI

struct AddressView: View {
	@ObservedObject var classOrder: ClassOrder
	
    var body: some View {
		Form {
			Section {
				TextField("Name", text: $classOrder.order.name)
				TextField("Street address", text: $classOrder.order.streetAddress)
				TextField("City", text: $classOrder.order.city)
				TextField("Zip", text: $classOrder.order.zip)
			}
			
			Section {
				NavigationLink{
					CheckoutView(classOrder: classOrder)
				} label: {
					Text("Check out")
				}
			}
			.disabled(classOrder.order.hasValidAddress)
		}
		.navigationTitle("Delivery Details")
		.navigationBarTitleDisplayMode(.inline)
    }
	
}


struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
		AddressView(classOrder: ClassOrder())
    }
}
