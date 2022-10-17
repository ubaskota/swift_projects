//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Ujjwal Baskota on 6/22/22.
//
import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
	@FetchRequest var fetchRequest: FetchedResults<T>
	
	let content: (T) -> Content
	
    var body: some View {
		List(fetchRequest, id: \.self) { item in
			self.content(item)
		}
    }
	
	enum PredicateType: String{
		case beginsWith = "BEGINSWITH"
		case contains = "CONTAINS"
		case containsCI = "CONTAINS[c]"
	}
	
	init(filterKey: String, filterValue: String, predicateWord: String,@ViewBuilder content: @escaping (T) -> Content) {
		_fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: PredicateType.beginsWith.rawValue, filterKey, filterValue))
		self.content = content
	}
}
