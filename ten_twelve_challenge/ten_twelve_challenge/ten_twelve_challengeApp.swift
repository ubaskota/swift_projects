//
//  ten_twelve_challengeApp.swift
//  ten_twelve_challenge
//
//  Created by Ujjwal Baskota on 7/7/22.
//

import SwiftUI

@main
struct ten_twelve_challengeApp: App {
	@StateObject var dataController = DataController()
	
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
