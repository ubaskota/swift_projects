//
//  DataController.swift
//  CoreDataProjectFinal
//
//  Created by Ujjwal Baskota on 7/13/22.
//

import Foundation
import CoreData



class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "CoreDataProjectFinal")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core data failed to load: \(error.localizedDescription)")
			}
			
			self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
		}
	}
}
