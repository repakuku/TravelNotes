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
	@State private var isSavingNote = false

	var body: some View {
		NavigationStack {
			List {
				if notesService.notes.isEmpty {
					Text(Titles.NotesScene.noNotes.description)
				}
				ForEach(notesService.notes, id: \.id) { note in
					NoteView(note: note)
				}
				.onDelete { indices in
					for index in indices {
						let note = notesService.notes[index]
						Task {
							await notesService.delete(note)
						}
					}
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
			.toolbar {
				ToolbarItem(placement: .bottomBar) {
					Button(Titles.NotesScene.newNote.description) {
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
