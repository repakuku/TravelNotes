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
	@EnvironmentObject private var storageService: StorageService
	@State private var name = ""
	@State private var description = ""
	@State private var image: Data? = nil

	var body: some View {
		Form {
			Section(Titles.SaveNote.Section.details.description) {
				TextField(Titles.SaveNote.TextField.name.description, text: $name)
				TextField(Titles.SaveNote.TextField.description.description, text: $description)
			}

			Section(Titles.SaveNote.Section.picture.description) {
				PicturePickerView(selectedData: $image)
			}

			Button(Titles.SaveNote.Button.saveNote.description) {
				let imageName = image != nil ? UUID().uuidString : nil
				let note = Note(
					name: name,
					description: description.isEmpty ? nil : description,
					image: imageName
				)

				Task {
					if let image, let imageName {
						await storageService.upload(image, name: imageName)
					}

					await notesService.save(note)

					dismiss()
				}
			}
		}
	}
}
