//
//  DataController.swift
//  ten_twelve_challenge
//
//  Created by Ujjwal Baskota on 7/20/22.
//

import Foundation
import CoreData


class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "ten_twelve_challenge")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core data failed to load: \(error.localizedDescription)")
				return
			}
			
			self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
		}
	}
}
