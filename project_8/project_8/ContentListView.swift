//
//  ContentListView.swift
//  project_8
//
//  Created by Ujjwal Baskota on 5/8/22.
//

import SwiftUI


struct MissionViewRow: View {
	
	var mission : Mission
	var astronauts: [String: Astronaut]
	
	var body: some View {
		MissionView(mission: mission, astronauts: astronauts)
	}
}


struct ContentListView: View {
	let astronauts: [String: Astronaut]
	let missions: [Mission]
	
    var body: some View {
		NavigationView {
				List {
					ForEach(missions) { mission in
						NavigationLink(mission.displayName, destination: MissionViewRow(mission: mission, astronauts: astronauts))
				}
			}
		}
			.navigationTitle("Moonshot")
			.background(.darkBackground)
			.preferredColorScheme(.dark)
    }
}


struct ContentListView_Previews: PreviewProvider {
	
	static let missions: [Mission] = Bundle.main.decode("missions.json")
	static let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
	
    static var previews: some View {
        ContentListView(astronauts: astronauts, missions: missions)
    }
}
