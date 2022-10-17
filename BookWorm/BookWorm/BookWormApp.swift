//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Ujjwal Baskota on 6/13/22.
//

import SwiftUI

@main
struct BookWormApp: App {
	@StateObject private var dataController = DataController()
	
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
