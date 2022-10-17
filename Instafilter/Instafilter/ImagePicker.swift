//
//  ImagePickeer.swift
//  Instafilter
//
//  Created by Ujjwal Baskota on 7/28/22.
//
import PhotosUI
import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
	class Coordinator {
		
	}
	
	func makeUIViewController(context: Context) -> PHPickerViewController {
		var config = PHPickerConfiguration()
		config.filter = .images
		
		let picker = PHPickerViewController(configuration: config)
		picker.delegate = context.coordinator
		return picker
	}
	
	func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
		
	}
	
	
	func makeCoordinator() -> Coordinator {
		Coordinator()
	}
		
}
