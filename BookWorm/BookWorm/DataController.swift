//
//  DataController.swift
//  BookWorm
//
//  Created by Ujjwal Baskota on 6/13/22.
//

import Foundation
import CoreData


class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "BookWorm")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data Failed to load: \(error.localizedDescription)")
			}
			
			
		}
	}
}
