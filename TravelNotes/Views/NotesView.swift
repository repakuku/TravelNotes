//
//  NotesView.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import SwiftUI

struct NotesView: View {
	@EnvironmentObject private var authenticationSrrvice: AuthenticationService
	@EnvironmentObject private var notesService: NotesService
	@EnvironmentObject private var storageService: StorageService
	@State private var isSavingNote = false

	var body: some View {
		NavigationStack {
			List {
				if notesService.notes.isEmpty {
					Text(Titles.Notes.noNotes.description)
				}
				ForEach(notesService.notes, id: \.id) { note in
					NoteView(note: note)
				}
				.onDelete { indices in
					for index in indices {
						let note = notesService.notes[index]
						Task {
							await notesService.delete(note)
							if let image = note.image {
								await storageService.remove(withName: image)
							}
						}
					}
				}
			}
			.navigationTitle(Titles.Notes.notes.description)
			.toolbar {
				Button(Titles.Notes.signOut.description) {
					Task {
						await authenticationSrrvice.signOut()
					}
				}
			}
			.toolbar {
				ToolbarItem(placement: .bottomBar) {
					Button(Titles.Notes.newNote.description) {
						isSavingNote = true
					}
					.bold()
				}
			}
			.sheet(isPresented: $isSavingNote) {
				SaveNoteView()
			}
		}
		.task {
			await notesService.fetchNotes()
		}
	}
}
