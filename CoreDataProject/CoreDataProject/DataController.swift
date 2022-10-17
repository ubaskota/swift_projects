//
//  DataController.swift
//  CoreDataProject
//
//  Created by Ujjwal Baskota on 6/17/22.
//

import Foundation
import CoreData


class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "CoreDataProject")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data Failed to load: \(error.localizedDescription)")
				return
			}
			
			self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
		}
	}
}
