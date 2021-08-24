//
//  ContentView.swift
//  rockPaperScissor
//
//  Created by Ujjwal Baskota on 6/21/21.
//

import SwiftUI

struct ContentView: View {
	
	@State private var selections = ["rock", "paper", "scissor"]
	@State private var appRandom = Int.random(in: 0...2)
	@State private var appSelects = ""
	@State private var userSelects = ""
	@State private var userScore = 0
	@State private var appScore = 0
	@State private var totalGames = 0
	@State private var scoreText = ""
	@State private var scoreTitle = ""
	@State private var showScore = false

	
	
    var body: some View {
		ZStack {
			LinearGradient(gradient: Gradient(colors: [.green, .black]),
			startPoint: .top, endPoint: .bottom)
			.edgesIgnoringSafeArea(.all)
			
			VStack {
				VStack(spacing: 30) {
					Text("Rock, Paper or Scissor")
						.foregroundColor(.white)
						.font(.title)
						.fontStyle()
					
					ForEach(0 ..< 3) { number in
						Button(action: {
							self.pictureSelected(number)
						}) {
							Image(self.selections[number])
								.renderingMode(.original)
								.resizable()
								.frame(width: 100.0, height: 100.0)
								.shadow(color: .black, radius: 2)
						}
					}
				}
				
				VStack(spacing: 30) {
					Text("You: \(userScore)  Computer: \(appScore)  TotalGames: \(totalGames)")
						.foregroundColor(.white)
						.font(.callout)
				}
			}
		}
		.alert(isPresented: $showScore) {
			if totalGames < 10 {
				return Alert(title: Text(scoreTitle), message : Text(scoreText),
					  dismissButton: .default(Text("continue")) {
						self.finalCheck()
					  })
			} else {
				return Alert(title: Text("Game Over!"), message : Text(userScore > appScore ? "You Won!" : "You Lost!"),
					dismissButton: .default(Text("New Game")) {
						self.finalCheck()
							 }
				)
			}
		}
	}
	
	
	func pictureSelected(_ number: Int) {
		userSelects = selections[number]
		appSelects = selections[appRandom]
		totalGames += 1
		
		if userSelects == appSelects {
			scoreTitle = "Same element!!"
			scoreText = "Both players selected \(appSelects)"
		}
		else if userSelects == "scissor" {
			if appSelects == "rock" {
				self.userLostScore()
			}
			else {
				self.userGainedScore()
			}
		}
		else if userSelects == "paper" {
			if appSelects == "rock" {
				self.userGainedScore()
			}
			else {
				self.userLostScore()
			}
		}
		else if userSelects == "rock" {
			if appSelects == "paper" {
				self.userLostScore()
			}
			else {
				self.userGainedScore()
			}
		}
		showScore = true
	}
	
	
	func userLostScore() {
		
		appScore += 1
		scoreTitle = "\(appSelects) beats \(userSelects)!"
		scoreText = "Your score: \(userScore)   Computer score: \(appScore)."
	}
	
	
	func userGainedScore() {
		userScore += 1
		scoreTitle = "\(userSelects) beats \(appSelects)!"
		scoreText = "Your score: \(userScore)   Computer score: \(appScore)."
	}
	
	
	func finalCheck() {
		if totalGames < 10 {
			selections.shuffle()
			appRandom = Int.random(in: 0...2)
		}
		else {
			appScore = 0
			userScore = 0
			totalGames = 0
		}
	}
}


struct Font: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.white)
	}
}

// This is a test 
extension View {
	func fontStyle() -> some View {
		self.modifier(Font())
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//End End End Test
