//
//  ContentView.swift
//  iExpense_8
//
//  Created by Ujjwal Baskota on 2/15/22.
//

import SwiftUI

//struct ContentView: View {
//	@State private var numbers = [Int]()
//	@State private var currentNumber = 1
//
//    var body: some View {
//		NavigationView {
//			VStack {
//				List {
//					ForEach(numbers, id: \.self) {
//						Text("Row \($0)")
//					}
//					.onDelete(perform: removeRows(at:))
//				}
//
//				Button("Add Number") {
//					numbers.append(currentNumber)
//					currentNumber += 1
//				}
//			}
//			.navigationTitle("onDelete")
//			.toolbar {
//				EditButton()
//			}
//		}
//    }
//
//	func removeRows(at offsets: IndexSet) {
//		numbers.remove(atOffsets: offsets)
//	}
//}


//Storing user data
//struct ContentView: View {
//
//	@AppStorage("tapCount") private var tapCount = 0
//
//	var body: some View {
//		Button("Tap Count: \(tapCount)") {
//			tapCount += 1
//		}
//	}
//}

struct User: Codable {
	let firstName: String
	let lastName: String
}


struct ContentView: View {
	@State private var user = User(firstName: "Gula", lastName: "Myan")
	
	var body : some View {
		Button("Save User") {
			let encoder = JSONEncoder()
			
			if let data = try? encoder.encode(user) {
				UserDefaults.standard.set(data, forKey: "UserData")
			}
		}
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
