//
//  ContentView.swift
//  BookWorm
//
//  Created by Ujjwal Baskota on 6/13/22.
//

import SwiftUI

//
//struct PushButton: View {
//
//	let title: String
//	@Binding var isOn: Bool
//
//	var onColors = [Color.red, Color.yellow]
//	var offColors = [Color(white: 0.6), Color(white: 0.4)]
//
//	var body: some View {
//		Button(title) {
//			isOn.toggle()
//		}
//		.padding()
//		.background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
//		.foregroundColor(.white)
//		.clipShape(Capsule())
//		.shadow(radius: isOn ? 0: 5)
//	}
//}

//
//
//struct ContentView: View {
//	@State private var rememberMe = false
//
//    var body: some View {
//		VStack {
//			PushButton(title: "Remember Me", isOn: $rememberMe)
//			Text(rememberMe ? "On" : "Off")
//		}
//    }
//}



struct ContentView: View {
	
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(sortDescriptors: [SortDescriptor(\.title),
									SortDescriptor(\.author)]) var books: FetchedResults<Book>
	
	@State private var showingAddScreen = false

    var body: some View {
		NavigationView {
			List {
				ForEach(books) { book in
					NavigationLink {
//						Text(book.title ?? "Unknown Title")
						DetailView(book: book)
					} label: {
						HStack {
							EmojiRatingView(rating: book.rating)
								.font(.largeTitle)
							
							VStack(alignment: .leading) {
								Text(book.title ?? "Unknown Title")
									.font(.headline)
									.foregroundColor(book.rating == 1 ? Color.red : Color.black)
								
								Text(book.author ?? "Unknown Author")
									.foregroundColor(.secondary)
							}
						}
					}
				}
				.onDelete(perform: deleteBookos)
			}
			.navigationTitle("BookoWorm")
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					EditButton()
				}
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						showingAddScreen.toggle()
					} label: {
						Label("Add Book", systemImage: "plus")
					}
				}
			}
			.sheet(isPresented:$showingAddScreen) {
				AddBookView()
			}
		}
    }
	
	func deleteBookos(at offsets: IndexSet) {
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
