//
//  TravelNotesApp.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import Amplify
import SwiftUI

@main
struct TravelNotesApp: App {

	init() {
		do {
			try Amplify.configure()
			print("initialized Amplify")
		} catch {
			print("Could not initialize Amplify: \(error)")
		}
	}

    var body: some Scene {
        WindowGroup {
            NotesView()
        }
    }
}
