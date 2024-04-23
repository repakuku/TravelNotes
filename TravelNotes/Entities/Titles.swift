//
//  Titles.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import Foundation

enum Titles {

	enum NotesScene {
		case noNotes
		case notes
		case newNote

		case signOut

		var description: String {
			switch self {
			case .noNotes:
				return "No notes"
			case .notes:
				return "Notes"
			case .signOut:
				return "Sign Out"
			case .newNote:
				return "New Note"
			}
		}
	}

	enum LandingScene {
		case signIn

		var description: String {
			switch self {
			case .signIn:
				return "Sign In"
			}
		}
	}

	enum SaveNoteScene {
		enum Section {
			case details
			case picture

			var description: String {
				switch self {
				case .details:
					return "Details"
				case .picture:
					return "Picture"
				}
			}
		}

		enum Button {
			case saveNote

			var description: String {
				switch self {
				case .saveNote:
					return "Save Note"
				}
			}
		}

		enum TextField {
			case name
			case description
			case imageName

			var description: String {
				switch self {
				case .name:
					return "Name"
				case .description:
					return "Description"
				case .imageName:
					return "Image Name"
				}
			}
		}
	}
}
