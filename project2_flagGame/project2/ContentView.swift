//
//  ContentView.swift
//  project2
//
//  Created by Ujjwal Baskota on 6/8/21.
//

import SwiftUI

struct ContentView: View {
	
	@State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
	
	@State private var correctAnswer = Int.random(in: 0...2)
	
	@State private var showingScore = false
	@State private var scoreTitle = ""
	@State private var scoreText = ""
	@State private var currentScore = 0
	
	var body: some View {
		ZStack {
//			Color.blue.edgesIgnoringSafeArea(.all)
			LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom) .edgesIgnoringSafeArea(.all)
			
			VStack {
				VStack(spacing: 30) {
					Text("Tap the flag of ")
						.foregroundColor(.white)
					
					Text(countries[correctAnswer])
						.foregroundColor(.white)
						.font(.largeTitle)
						.fontWeight(.black)
				}
				
				
				ForEach(0 ..< 3) { number in
					Button(action: {
						self.flagTapped(number)
					}) {
						Image(self.countries[number])
							.renderingMode(.original)
							.clipShape(Capsule())
							.shadow(color: .black, radius: 2)
					}
				}
				Spacer()
				
				VStack {
						Text("Your current score : \(currentScore)")
							.foregroundColor(.white)
				}
				
			}
		}
		.alert(isPresented: $showingScore) {
			Alert(title: Text(scoreTitle), message : Text(scoreText),
				  dismissButton: .default(Text("continue")) {
					self.askQuestion()
				  })
		}
	}
	
	func flagTapped(_ number: Int) {
		if number == correctAnswer {
			currentScore += 1
			scoreTitle = "Correct!!!"
			scoreText = " Your score is \(currentScore)"
		}
		else {
			scoreTitle = "Wrong!"
			scoreText = "That's the flag of \(countries[number])"
		}
		showingScore = true
	}
	
	func askQuestion() {
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
