//
//  ContentView.swift
//  project_8
//
//  Created by Ujjwal Baskota on 4/11/22.
//

import SwiftUI

struct ContentView: View {
	
	@State private var showingGrid = true
	
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	
	let columns = [
		GridItem(.adaptive(minimum: 150))
	]
	
	
    var body: some View {
		NavigationView {

			Group {
				if showingGrid {
					ContentGridView(astronauts: astronauts, missions: missions)
				}
				else {
					ContentListView(astronauts: astronauts, missions: missions)
				}
			}
			.toolbar{
				Button("Toggle") {
					showingGrid.toggle()
				}
				.buttonStyle(.borderedProminent)
			}
			.background(.darkBackground)
			.preferredColorScheme(.dark)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
