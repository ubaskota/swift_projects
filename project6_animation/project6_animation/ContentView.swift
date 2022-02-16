//
//  ContentView.swift
//  project6_animation
//
//  Created by Ujjwal Baskota on 1/24/22.
//

import SwiftUI

//struct ContentView: View {
//
//	@State private var animationAmount = 1.0
//
//    var body: some View {
//		Button("Tap me") {
//			animationAmount += 1
//		}
//		.padding(50)
//		.background(.red)
//		.foregroundColor(.white)
//		.clipShape(Circle())
//		.overlay(Circle()
//					.stroke(.red)
//					.scaleEffect(animationAmount)
//					.opacity(2 - animationAmount)
//					.animation(
//						.easeInOut(duration: 2)
//							.repeatForever(autoreverses: true), value: animationAmount)
//		)
//		.onAppear{
//			animationAmount = 2
//		}
//    }
//}


//struct ContentView: View {
//
//	@State private var animationAmount = 1.0
//
//	var body: some View {
//		print(animationAmount)
//		return VStack {
//			Stepper("Scale amount", value: $animationAmount.animation(
//				.easeInOut(duration: 1)
//					.repeatCount(3, autoreverses: true)
//			), in : 1...10)
//
//			Spacer()
//
//			Button("Tap me") {
//				animationAmount += 1
//			}
//			.padding(50)
//			.background(.red)
//			.foregroundColor(.white)
//			.clipShape(Circle())
//			.scaleEffect(animationAmount)
//		}
//	}
//}


struct ContentView: View {
	
	@State private var animationAmount = 0.0
	
	var body: some View {
		
		Button("Tap me") {
			withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
				animationAmount += 360
			}
		}
		.padding(50)
		.background(.red)
		.foregroundColor(.white)
		.clipShape(Circle())
		.rotation3DEffect(.degrees(animationAmount), axis: (x:0, y:1, z:0))
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
