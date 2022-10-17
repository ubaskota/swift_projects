

import Foundation
import CoreData


class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "CoreDataProject2")
	
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
