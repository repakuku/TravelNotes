//
//  NotesService.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import Amplify
import SwiftUI

@MainActor
final class NotesService: ObservableObject {
	@Published var notes: [Note] = []

	func fetchNotes() async {
		do {
			let result = try await Amplify.API.query(request: .list(Note.self))
			switch result {
			case .success(let notesList):
				notes = notesList.elements
			case .failure(let error):
				print("Fetch Notes failed with error: \(error)")
			}
		} catch {
			print("Fetch Notes failed with error: \(error)")
		}
	}

	func save(_ note: Note) async {
		do {
			let result = try await Amplify.API.query(request: .create(note))
			switch result {
			case .success(let note):
				print("Save note completed")
				notes.append(note)
			case .failure(let error):
				print("Save Note failed with error: \(error)")
			}
		} catch {
			print("Save Note failed with error: \(error)")
		}
	}

	func delete(_ note: Note) async {
		do {
			let result = try await Amplify.API.query(request: .delete(note))
			switch result {
			case .success(let note):
				print("Delete note completed")
				notes.removeAll(where: { $0.id == note.id })
			case .failure(let error):
				print("Delete Note failed with error: \(error)")
			}
		} catch {
			print("Delete Note failed with error: \(error)")
		}
	}
}