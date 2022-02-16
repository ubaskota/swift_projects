//
//  ContentView.swift
//  project_5
//
//  Created by Ujjwal Baskota on 12/13/21.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		List {
			Section("Sectioon 1") {
				Text("Static row 1")
				Text("Static row 1")
			}
			
			Section("Section 2") {
				ForEach(0..<5) {
					Text("Dynamic row \($0)")
				}
			}
			Section("Section 3") {
				Text("Static row 1")
				Text("Static row 2")
			}
		}
		.listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
