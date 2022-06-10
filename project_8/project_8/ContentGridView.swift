//
//  ContentView.swift
//  project_8
//
//  Created by Ujjwal Baskota on 4/11/22.
//

import SwiftUI

struct ContentGridView: View {
	let astronauts: [String: Astronaut]
	let missions: [Mission]
	
	let columns = [
		GridItem(.adaptive(minimum: 150))
	]
	
	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid (columns: columns) {
					ForEach(missions) { mission in
						NavigationLink {
							MissionView(mission: mission, astronauts: astronauts)
						} label : {
							VStack {
							Image(mission.image)
								.resizable()
								.scaledToFit()
								.frame(width: 100, height: 100)
								.padding()
							
								VStack {
									Text(mission.displayName)
										.font(.headline)
										.foregroundColor(.white)
									
									Text(mission.formattedLaunchDate)
										.font(.caption)
										.foregroundColor(.white.opacity(0.5))
								}
								.padding(.vertical)
								.frame(maxWidth: .infinity)
								.background(.lightBackground)
							}
							.clipShape(RoundedRectangle(cornerRadius: 10))
							.overlay(
								RoundedRectangle(cornerRadius: 10)
									.stroke(.lightBackground)
							)
						}
					}
					.padding([.horizontal, .bottom])
				}
			}
//			.navigationTitle("Moonshot")
			.background(.darkBackground)
			.preferredColorScheme(.dark)
		}
		.navigationTitle("Moonshot")
	}
}

struct ContentGridView_Previews: PreviewProvider {
	
	static let missions: [Mission] = Bundle.main.decode("missions.json")
	static let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
	
	static var previews: some View {
		ContentGridView(astronauts: astronauts, missions: missions)
			.preferredColorScheme(.dark)
	}
}
