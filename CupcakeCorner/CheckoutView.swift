//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ujjwal Baskota on 6/7/22.
//

import SwiftUI

struct CheckoutView: View {
	@ObservedObject var classOrder: ClassOrder
	
	@State private var confirmationMessage = ""
	@State private var showingConfirmation = false
	
    var body: some View {
		ScrollView {
			VStack {
				AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
					image
						.resizable()
						.scaledToFit()
				}
			placeholder: {
				ProgressView()
			}
			.frame(height: 233)
				Text("Your total is \(classOrder.order.cost, format: .currency(code: "USD"))")
					.font(.title)
				
				Button("Place Order") {
					Task{
					await placeOrder()
					}
				}
					.padding()
			}
		}
		.navigationTitle("Check out")
		.navigationBarTitleDisplayMode(.inline)
		.alert("Thank you", isPresented: $showingConfirmation) {
			Button("OK") {}
		} message: {
			Text(confirmationMessage)
		}
    }
	
	
	func placeOrder() async {
		guard let encoded = try? JSONEncoder().encode(classOrder.order) else {
			print("Failed to encode order")
			return
		}
		
		let url = URL(string: "https://reqres.in/api/cupcakes")!
		var  request = URLRequest(url: url)
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "POST"
		
		
		do {
			let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
			let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
			confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes on its way!"
			showingConfirmation = true
		} catch {
			confirmationMessage  = "Error sending request!"
			showingConfirmation = true
			print("Checkout Failed")
		}
		
	}
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
		CheckoutView(classOrder: ClassOrder())
    }
}
