//
//  TravelNotesApp.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import Amplify
import AWSAPIPlugin
import AWSCognitoAuthPlugin
import AWSS3StoragePlugin
import SwiftUI

@main
struct TravelNotesApp: App {

	init() {
		do {
			try Amplify.add(plugin: AWSCognitoAuthPlugin())
			try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: AmplifyModels()))
			try Amplify.add(plugin: AWSS3StoragePlugin())
			try Amplify.configure()
			print("initialized Amplify")
		} catch {
			print("Could not initialize Amplify: \(error)")
		}
	}

	var body: some Scene {
		WindowGroup {
			LandingView()
				.environmentObject(AuthenticationService())
				.environmentObject(NotesService())
				.environmentObject(StorageService())
		}
	}
}
