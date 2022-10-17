//
//  CoreDataProjectOneApp.swift
//  CoreDataProjectOne
//
//  Created by Ujjwal Baskota on 6/23/22.
//

import SwiftUI

@main
struct CoreDataProjectOneApp: App {
	@StateObject private var dataController = DataController()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
			.environment(\.managedObjectContext, dataController.container.viewContext)
			
		}
    }
}
