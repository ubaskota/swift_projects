//
//  ContentView.swift
//  edutainment
//
//  Created by Ujjwal Baskota on 2/7/22.
//

import SwiftUI

struct ContentView: View {
	@State private var practiceNumber : Int = 1
	@State private var totalProblems = "5"
	@State private var showTestView = false
	var selectOptions = ["5", "10"]
	
	
    var body: some View {
		VStack {
			HStack {
				Text("Choose a number to practice ")
					.foregroundColor(.purple)
					.font(.system(size: 25))
					.fontWeight(.black)
				
				Picker("Select the number to practice : ", selection: $practiceNumber) {
					ForEach(0..<12) {
						Text("\($0)")
					}
				}
			}
			
			.labelsHidden()
			Text("You selected: \(practiceNumber)")
				.foregroundColor(.blue)
				.fontWeight(.black)
			
		VStack {
			Text("How many problems do you want?")
				.foregroundColor(.black)
				.font(.system(size: 20))
				.fontWeight(.medium)
			Picker ("Number of problems", selection: $totalProblems) {
				ForEach(selectOptions, id:\.self) {
					Text($0)
				}
			}
			.pickerStyle(.segmented)
			.background()
		}
			
			let writerForSecondView = Writer(practiceNum: practiceNumber, numOfProblems: totalProblems
		)
			
			Button (action: {
				self.showTestView.toggle()
			}, label: {
				Text("Go")
			})
				.background(Color.red)
				.font(.largeTitle)
			
				.sheet(isPresented: $showTestView) {
					SecondView(writer: writerForSecondView)
				}
			
		}
		.accentColor(Color.black)
		.background(Color.green)
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SecondView: View {
//	@State private var correctAnswer = Int.random(in: )
	@State private var totalScore = 0
	@State private var facedProblems = 0
	@State private var scoreTitle = ""
	@State private var scoreText = ""
	@State private var showingAlert = false
	@State private var showHomeView = false

	var writer: Writer
	var body: some View {
		let multiplierOne: Int = writer.practiceNum
		let totalProblemsRequested = writer.numOfProblems
		let multiplierTwo: Int = Int.random(in: 1..<13)
		
		ZStack {
			VStack {
				Button (action: {
					self.showHomeView.toggle()
				}, label: {
					Text("Home")
				})
					.padding()
			Spacer()
			}
			
			VStack {
				Text("What is \(String(multiplierOne)) X \(String(multiplierTwo))?")
				
				let correctAnswer = multiplierOne * multiplierTwo
				let randomNumbers: [Int] = self.createRandomNumbers(num1: multiplierOne, correctAns: correctAnswer)
				
				ForEach(randomNumbers.shuffled(), id: \.self) {number in
					Button (action: {
						totalScore += isCorrect(num:number , correctAns: correctAnswer) ? 1 : -1
						totalScore = (totalScore < 0) ? 0 : totalScore
						isGameOver(totalFaced: facedProblems, totalRequested: Int(totalProblemsRequested) ?? 0)
						
					}, label: {
						Text(String(number))
					})
						.padding()
						.background(Color(red: 0, green: 0, blue: 0.5))
						.clipShape(Capsule())
				}
			}
		}
		
		VStack {
//			Spacer()
			Text("Total Score: \(totalScore)")
				.padding()
				.padding()
			Text("Total solved: \(facedProblems)")
		}
		.alert(isPresented: $showingAlert) {
			Alert(title: Text(scoreTitle), message: Text(scoreText),
				  primaryButton: .destructive(Text("Home")) {
				self.showHomeView.toggle()
			},
				  secondaryButton: .cancel(Text("Replay")) {
				self.resetGame()
			})
		}
		.sheet(isPresented: $showHomeView) {
			ContentView()
		}
		
	}
	
	
	func resetGame() {
		showingAlert = false
		totalScore = 0
		facedProblems = 0
		showingAlert = false
	}
	
	func isGameOver(totalFaced: Int, totalRequested: Int) {
		if totalFaced == totalRequested {
			showingAlert = true
			scoreTitle = "Game Over!"
			scoreText = "You scored \(self.totalScore) out of \(totalRequested)."
		}
	}
	
	func isCorrect(num: Int, correctAns: Int) -> Bool {
		facedProblems += 1
		if num == correctAns {
			return true
		}
		return false
	}
	
	func createRandomNumbers(num1: Int, correctAns: Int) -> [Int] {
		let numberArray = (0..<10).map{ _ in Int.random(in: 1 ... 12) }
		print(numberArray)
		var finalNumArray = [Int]()
		for num in numberArray{
			if (!finalNumArray.contains(num) && !(num * num1 == correctAns)) {
				finalNumArray.append(num)
			}
			if finalNumArray.count == 4 {
				break
			}
		}
		finalNumArray = finalNumArray.map{$0 * num1}
		finalNumArray.append(correctAns)
		return finalNumArray
	}
}


struct SecondView_previews: PreviewProvider {
	
	static let writerPreview = Writer(
		practiceNum: 1,
		numOfProblems: "5")
	
	static var previews: some View {
		SecondView(writer: writerPreview)
	}
}

struct Writer {
	var practiceNum: Int
	var numOfProblems: String
}
