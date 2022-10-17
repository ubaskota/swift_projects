//
//  Candy+CoreDataProperties.swift
//  CoreDataProjectFinal
//
//  Created by Ujjwal Baskota on 7/14/22.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
	
	public var wrappedName: String {
		name ?? "Unknown Candy"
	}

}

extension Candy : Identifiable {

}
