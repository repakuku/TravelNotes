//
//  LandingView.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import AuthenticationServices
import SwiftUI

struct LandingView: View {
	@EnvironmentObject private var authenticationService: AuthenticationService
	@State private var isLoading = true

	var body: some View {
		ZStack {
			if isLoading {
				ProgressView()
			}

			Group {
				if authenticationService.isSignedIn {
					NotesView()
				} else {
					Button(Titles.LandingScene.signIn.description) {
						Task {
							await authenticationService.signIn(presentationAnchor: window)
						}
					}
				}
			}
			.opacity(isLoading ? Const.lowOpacity : Const.highOpacity)
			.disabled(isLoading)
		}
		.task {
			isLoading = true
			await authenticationService.fetchSession()
			if !authenticationService.isSignedIn {
				await authenticationService.signIn(presentationAnchor: window)
			}
			isLoading = false
		}
	}

	private var window: ASPresentationAnchor {
		if let delegate = UIApplication.shared.connectedScenes.first?.delegate as? UIWindowSceneDelegate,
		   let window = delegate.window as? UIWindow {
			return window
		}

		return ASPresentationAnchor()
	}

	private struct Const {
		static let highOpacity: CGFloat = 1
		static let lowOpacity: CGFloat = 0.5
	}
}

#Preview {
	LandingView()
		.environmentObject(AuthenticationService())
}
