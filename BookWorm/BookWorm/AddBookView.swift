//
//  AddBookView.swift
//  BookWorm
//
//  Created by Ujjwal Baskota on 6/14/22.
//

import SwiftUI

struct AddBookView: View {
	@Environment(\.managedObjectContext) var moc
	@Environment(\.dismiss) var dismiss
	
	@State private var title = ""
	@State private var author = ""
	@State private var rating = 3
	@State private var genre = ""
	@State private var review = ""
//	var add_date = convertDateFormatter(date: Date.now)
	@State private var date = Date.now
	
	
	let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Name of boook", text: $title)
					TextField("Author's name", text: $author)
					
					Picker("Genre", selection: $genre) {
						ForEach(genres, id: \.self) {
							Text($0)
						}
					}
				}
				
				Section {
					TextEditor(text: $review)
					RatingView(rating: $rating)
					
					Picker("Rating", selection: $rating) {
						ForEach(0..<6) {
							Text(String($0))
						}
					}
				} header: {
						Text("Write a review")
					}
					
					Section {
						Button("Save") {
							let newBook = Book(context: moc)
							newBook.id = UUID()
							newBook.title = title
							newBook.author = author
							newBook.rating = Int16(rating)
							newBook.genre = genre
							newBook.review = review
							newBook.date = date
							
							try? moc.save()
							dismiss()
						}
						.disabled(disableForm)
					}
				}
			}
		.navigationTitle("Add Book")
    }
	
	var disableForm: Bool {
		if title.count < 1 || author.count < 1 || genre.count < 1 {
			return true
		}
		return false
	}
	
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
