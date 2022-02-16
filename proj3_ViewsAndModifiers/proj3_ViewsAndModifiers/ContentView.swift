//
//  ContentView.swift
//  proj3_ViewsAndModifiers
//
//  Created by Ujjwal Baskota on 6/16/21.
//

import SwiftUI



struct Font: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
	}
}

extension View {
	func fontStyle() -> some View {
		self.modifier(Font())
	}
}

struct ContentView: View {
	var body: some View {
		Text("Hello World")
			.fontStyle()
	}
}

//struct ContentView: View {
//    var body: some View {
//		Button("Hello World") {
//			// sth
//		}
//		.background(Color.red)
//		.frame(width: 100, height: 200)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
