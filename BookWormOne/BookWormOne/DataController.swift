//
//  DataController.swift
//  BookWormOne
//
//  Created by Ujjwal Baskota on 7/12/22.
//

import Foundation
import CoreData



class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "Bookworm")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core data failed to load: \(error.localizedDescription)")
			}
		}
	}
}
