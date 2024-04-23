//
//  NotesView.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import SwiftUI

struct NotesView: View {
	@State var notes: [Note] = []

	var body: some View {
		NavigationStack {
			List {
				if notes.isEmpty {
					Text(Titles.noNotes.description)
				}
				ForEach(notes, id: \.id) { note in
					NoteView(note: note)
				}
			}
			.navigationTitle(Titles.notes.description)
		}
	}
}

enum Titles {
	case noNotes
	case notes

	var description: String {
		switch self {
		case .noNotes:
			"No notes"
		case .notes:
			"Notes"
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
