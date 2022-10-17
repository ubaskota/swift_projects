//
//  CoreDataProjectFinalApp.swift
//  CoreDataProjectFinal
//
//  Created by Ujjwal Baskota on 7/13/22.
//

import SwiftUI

@main
struct CoreDataProjectFinalApp: App {
	@StateObject private var dataController = DataController()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
