//
//  NoteView.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import SwiftUI

struct NoteView: View {
	@State var note: Note

	var body: some View {
		HStack(alignment: .center, spacing: Const.spacing) {
			VStack(alignment: .leading, spacing: Const.spacing) {
				Text(note.name)
					.bold()
				if let description = note.description {
					Text(description)
				}
			}

			if let image = note.image {
				Spacer()

				Divider()

				RemoteImageView(name: image)
					.frame(width: Const.width, height: Const.height)
			}
		}
	}

	private struct Const {
		static let spacing: CGFloat = 5

		static let width: CGFloat = 30
		static let height: CGFloat = 30
	}
}
