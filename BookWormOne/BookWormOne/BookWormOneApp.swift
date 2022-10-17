//
//  BookWormOneApp.swift
//  BookWormOne
//
//  Created by Ujjwal Baskota on 7/12/22.
//

import SwiftUI

@main
struct BookWormOneApp: App {
	@StateObject private var dataController = DataController()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
