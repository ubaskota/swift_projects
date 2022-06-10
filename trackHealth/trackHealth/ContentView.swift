//
//  ContentView.swift
//  trackHealth
//
//  Created by Ujjwal Baskota on 5/25/22.
//

import SwiftUI

struct ContentView: View {
	let mainTopics: [String] = ["Food", "Workout", "Sleep"]
	var topicImage : [String: String] = ["food": "foodImg", "Workout": "workoutImg", "Sleep": "sleepImg"]
	
    var body: some View {
		NavigationView {
			ScrollView {
				ForEach(mainTopics, id: \.self) { topic in
//					Group {
//						if topic == "Food" {
//							FoodView()
//						}
//						else if topic == "Workout" {
//							WorkoutView()
//						}
//						else if topic == "Sleep" {
//							SleepView()
//						}
//				}
					
					NavigationLink {
						FoodView()
					} label: {
					VStack {
						Image(topicImage[topic] ?? "foodImg")
							.resizable()
							.scaledToFit()
							.frame(width: 200, height: 200)
							.padding()
						
						VStack {
							Text(topic)
								.font(.headline)
								.foregroundColor(.green)
						}
						.padding(.vertical)
						.frame(maxWidth: .infinity)
						.background(.darkBackground)
						}
					.clipShape(RoundedRectangle(cornerRadius: 20))
					.overlay(RoundedRectangle(cornerRadius: 20)
						.stroke(.lightBackground))
					}
				}
				.padding([.horizontal, .bottom])
			}
		}
		.background(.darkBackground)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
