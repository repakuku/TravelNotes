//
//  TravelNotesApp.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import Amplify
import AWSCognitoAuthPlugin
import SwiftUI

@main
struct TravelNotesApp: App {

	private let authenticationService: AuthenticationService

	init() {
		do {
			try Amplify.add(plugin: AWSCognitoAuthPlugin())
			try Amplify.configure()
			print("initialized Amplify")
		} catch {
			print("Could not initialize Amplify: \(error)")
		}

		authenticationService = AuthenticationService()
	}

	var body: some Scene {
		WindowGroup {
			LandingView()
				.environmentObject(authenticationService)
		}
	}
}
