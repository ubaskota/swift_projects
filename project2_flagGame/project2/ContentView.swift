//
//  ContentView.swift
//  project2
//
//  Created by Ujjwal Baskota on 6/8/21.
//

import SwiftUI


struct FlagImage: View {
	var imageName : String
	
	var body: some View {
		Image(imageName)
			.renderingMode(.original)
			.clipShape(Capsule())
			.shadow(color: .black, radius: 2)
	}
}

struct ContentView: View {
	
	@State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
	
	@State private var correctAnswer = Int.random(in: 0...2)
	
	@State private var showingScore = false
	@State private var scoreTitle = ""
	@State private var scoreText = ""
	@State private var currentScore = 0
	@State private var animationAmount = 0.0
	@State private var opacityValue = 1.0
	@State private var answerStatus = false
	@State private var isCorrect = false
	
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
						withAnimation(.interpolatingSpring( stiffness: 5, damping: 8)) {
							self.flagTapped(number)
							answerStatus = true
							animationAmount += correctSelection(number: number) ? 360 : 0
						}
					}) {
//						FlagImage(imageName: self.countries[number])
//							.rotation3DEffect(.degrees(animationAmount), axis: (x:0, y: (self.correctAnswer == number) ? 1:0, z:0))
							
						
//						This is what the image for the flags was before I created a custoomo view called FlagImage.
						Image(self.countries[number])
							.renderingMode(.original)
							.clipShape(Capsule())
							.shadow(color: .black, radius: 2)
							.rotation3DEffect(.degrees(animationAmount), axis: (x:0, y: (self.correctAnswer == number) ? 1:0, z:0))
							.transition((self.correctAnswer != number && answerStatus == true) ? .slide: .scale)
							.opacity(self.correctAnswer != number && answerStatus == true ? 0.25: 1)
					}
				}
//				HAHAHAHAHA decided to convert my incompetency and a bug into a feature
				if  isCorrect && self.answerStatus == true {
					Image(self.countries[self.correctAnswer])
						.background(Color.black)
						.frame(width: 300, height:1000)
						.border(Color.white)
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
			isCorrect = true
			currentScore += 1
			scoreTitle = "Correct!!! Flag of \(countries[number])"
			scoreText = " Your score is \(currentScore)"
		}
		else {
			isCorrect = false
			scoreTitle = "Wrong! Not a flag of \(countries[self.correctAnswer])"
			scoreText = "That's the flag of \(countries[number])"
		}
		showingScore = true
		// Some time for the animations to end before askQuestion is called.
//		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//			self.askQuestion()
//		}
	}
	
	
	func askQuestion() {
		answerStatus = false
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)
	}
	
	
	func correctSelection(number: Int) -> Bool {
		return number == correctAnswer
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
