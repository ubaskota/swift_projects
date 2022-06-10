//
//  mission.swift
//  project_8
//
//  Created by Ujjwal Baskota on 4/12/22.
//

import Foundation


struct Mission: Codable, Identifiable {
	
	struct CrewRole: Codable {
		let name: String
		let role: String
	}
	
	let id: Int
	let launchDate: Date?
	let description: String
	let crew: [CrewRole]
	
	var displayName: String {
		"appollo\(id)"
	}
	
	var image: String {
		"apollo\(id)"
	}
	
	var formattedLaunchDate: String {
		launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
	}
}
