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

		case signOut

		var description: String {
			switch self {
			case .noNotes:
				return "No notes"
			case .notes:
				return "Notes"
			case .signOut:
				return "Sign Out"
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

}
