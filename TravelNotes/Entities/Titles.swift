//
//  Titles.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import Foundation

enum Titles {

	enum Notes {
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

	enum Landing {
		case signIn

		var description: String {
			switch self {
			case .signIn:
				return "Sign In"
			}
		}
	}

	enum SaveNote {
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

	enum PicturePicker {
		case choosePicture
		case changePicture

		var description: String {
			switch self {
			case .choosePicture:
				return "Choose a picture"
			case .changePicture:
				return "Change picture"
			}
		}
	}
}
