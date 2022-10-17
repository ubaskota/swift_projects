//
//  ContentView.swift
//  BookWormOne
//
//  Created by Ujjwal Baskota on 7/12/22.
//

import SwiftUI



struct ContentView: View {
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(sortDescriptors: [SortDescriptor(\.title), SortDescriptor(\.author)]) var books: FetchedResults<Book>
	
	@State private var showingAddscreen = false
	
    var body: some View {
		NavigationView {
			List {
				ForEach(books) {book in
					NavigationLink {
						DetailView(book: book)
					} label : {
						HStack {
							EmojiRatingView(rating: book.rating)
								.font(.largeTitle)
							
							VStack(alignment: .leading) {
								Text(book.title ?? "Unknown Title")
									.font(.headline)
								
								Text(book.author ?? "Unknown author")
									.foregroundColor(.secondary)
							}
						}
					}
				}
				.onDelete(perform: deleteBooks)
			}
//			Text("Count: \(books.count)")
				.navigationTitle("Bookworm")
				.toolbar {
					ToolbarItem(placement: .navigationBarLeading) {
						EditButton()
					}
					
					ToolbarItem(placement: .navigationBarTrailing) {
						Button {
							showingAddscreen.toggle()
						} label: {
							Label("Add Book", systemImage: "plus")
						}
					}
				}
				.sheet(isPresented: $showingAddscreen) {
					AddBoookView()
				}
		}
    }
	
	func deleteBooks(at offsets: IndexSet) {
		for offset in offsets {
			let book = books[offset]
			moc.delete(book)
		}
//		try? moc.save()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
