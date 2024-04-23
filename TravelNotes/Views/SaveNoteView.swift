//
//  SaveNoteView.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import SwiftUI

struct SaveNoteView: View {
	@Environment(\.dismiss) private var dismiss
	@EnvironmentObject private var notesService: NotesService
	@State private var name = ""
	@State private var description = ""
	@State private var image = ""

	var body: some View {
		Form {
			Section(Titles.SaveNoteScene.Section.details.description) {
				TextField(Titles.SaveNoteScene.TextField.name.description, text: $name)
				TextField(Titles.SaveNoteScene.TextField.description.description, text: $description)
			}

			Section(Titles.SaveNoteScene.Section.picture.description) {
				TextField(Titles.SaveNoteScene.TextField.imageName.description, text: $image)
			}

			Button(Titles.SaveNoteScene.Button.saveNote.description) {
				let note = Note(
					name: name,
					description: description.isEmpty ? nil : description,
					image: image.isEmpty ? nil : image
				)

				Task {
					await notesService.save(note)
					dismiss()
				}
			}
		}
	}
}

#Preview {
	SaveNoteView()
}
