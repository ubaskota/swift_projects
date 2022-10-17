//
//  DetailView.swift
//  BookWorm
//
//  Created by Ujjwal Baskota on 6/14/22.
//

import SwiftUI

struct DetailView: View {
	let book: Book
	
	@Environment(\.managedObjectContext) var moc
	@Environment(\.dismiss) var dismiss
	@State private var showingDeleteAlert = false
	
    var body: some View {
		ScrollView {
			ZStack(alignment: .bottomTrailing) {
				Image(book.genre ?? "Fantasy")
					.resizable()
					.scaledToFit()
				
				Text(book.genre?.uppercased() ?? "FANTASY")
					.font(.caption)
					.fontWeight(.black)
					.padding(8)
					.foregroundColor(.white)
					.background(.black.opacity(0.75))
					.clipShape(Capsule())
					.offset(x: -5, y: -5)
			
				
			}
			
			Text("Added on :\(convertDateFormatter(date: book.date ?? Date.now))")
				.frame(maxWidth: .infinity, alignment: .center)
				.background(.black.opacity(0.20))
				.scaledToFit()
			
			Text(book.author ?? "Unknown Author")
				.font(.title)
				.foregroundColor(.secondary)
			
			Text(book.review ?? "No review")
				.padding()
			
			RatingView(rating: .constant(Int(book.rating)))
				.font(.largeTitle)
			
		}
		.navigationTitle(book.title ?? "Unknown Book")
		.navigationBarTitleDisplayMode(.inline)
		.alert("Delete book?", isPresented: $showingDeleteAlert) {
			Button("Delete", role: .destructive, action: deleteBook)
			Button("cancel", role: .cancel) {}
		} message : {
			Text("Are youo sure?")
		}
		.toolbar{
			Button {
				showingDeleteAlert = true
			} label : {
				Label("Delete this booko", systemImage: "trash")
			}
		}
    }
	
	
	func convertDateFormatter(date: Date) -> String {
		let dateFormatter = DateFormatter()
//		let date = dateFormatter.string(from: date)
//		dateFormatter.dateFormat = "yyyy-MM-dd"
//		dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
//		let convertedDate = dateFormatter.date(from: date)

//		guard dateFormatter.date(from: date) != nil else {
//			assert(false, "no date from string")
//			return ""
//		}

		dateFormatter.dateFormat = "yyyy MMM HH:mm EEEE"///this is what you want to convert format
		dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
		let timeStamp = dateFormatter.string(from: date)

		return timeStamp
	}
	
	
	
	func deleteBook() {
		moc.delete(book)
		
//		try moc.save()
		dismiss()
	}
}




//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
