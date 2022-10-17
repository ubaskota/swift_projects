//
//  UserView.swift
//  ten_twelve_challenge
//
//  Created by Ujjwal Baskota on 7/11/22.
//

import SwiftUI

struct UserView: View {
	let user: CachedUser

	var body: some View {
		List {
			Section {
				Text(user.wrappedAbout)
					.padding(.vertical)
			} header: {
				Text("About")
			}

			Section {
				Text("Address: \(user.wrappedAddress)")
				Text("Company: \(user.wrappedCompany)")
			} header: {
				Text("Contact details")
			}

			Section {
				ForEach(user.friendsArray) { friend in
					Text(friend.wrappedName)
				}
			} header: {
				Text("Friends")
			}
		}
		.listStyle(.grouped)
		.navigationTitle(user.wrappedName)
		.navigationBarTitleDisplayMode(.inline)
	}
}

//
//struct UserView_Previews: PreviewProvider {
//	static let user = [User]()[0]
//    static var previews: some View {
//		UserView(user: User.example)
//    }
//}
