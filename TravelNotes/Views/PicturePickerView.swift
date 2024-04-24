//
//  PicturePickerView.swift
//  TravelNotes
//
//  Created by Alexey Turulin on 4/23/24.
//

import PhotosUI
import SwiftUI

struct PicturePickerView: View {
	@State private var selectedPhoto: PhotosPickerItem? = nil
	@Binding var selectedData: Data?

	var body: some View {
		VStack {
			if let selectedData, let image = UIImage(data: selectedData) {
				Image(uiImage: image)
					.resizable()
					.frame(width: Const.width, height: Const.height)
					.clipShape(Circle())
					.overlay(Circle().stroke(.white, lineWidth: 4))
			}

			PhotosPicker(title, selection: $selectedPhoto)
		}
		.onChange(of: selectedPhoto) {
			Task {
				selectedData = try? await selectedPhoto?.loadTransferable(type: Data.self)
			}
		}
	}

	private var title: String {
		return selectedPhoto == nil
		? Titles.PicturePicker.choosePicture.description
		: Titles.PicturePicker.changePicture.description
	}

	private struct Const {
		static let width: CGFloat = 100
		static let height: CGFloat = 100
	}
}
