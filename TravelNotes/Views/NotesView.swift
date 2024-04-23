//
//  NotesView.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import SwiftUI

struct NotesView: View {
	@EnvironmentObject private var authenticationSrrvice: AuthenticationService
	@State var notes: [Note] = []

	var body: some View {
		NavigationStack {
			List {
				if notes.isEmpty {
					Text(Titles.NotesScene.noNotes.description)
				}
				ForEach(notes, id: \.id) { note in
					NoteView(note: note)
				}
			}
			.navigationTitle(Titles.NotesScene.notes.description)
			.toolbar {
				Button(Titles.NotesScene.signOut.description) {
					Task {
						await authenticationSrrvice.signOut()
					}
				}
			}
		}
	}
}

#Preview {
	NotesView(notes: [
		Note(
			name: "First note",
			description: "This is an example of a long note description that has \nexplicit line breaks.",
			image: "mic"
		),
		Note(
			name: "Second note",
			description: "This is a short description.",
			image: "phone"
		),
		Note(
			name: "Third note"
		)
	])
}
