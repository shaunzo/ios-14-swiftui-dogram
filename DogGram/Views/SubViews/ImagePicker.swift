//
//  ImagePicker.swift
//  DogGram
//
//  Created by Shaun Reddiar on 2021/09/04.
//

import Foundation
import SwiftUI


// 1. We create an ImagePicker struct which confirms to UIViewControllerRepresentable
struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var imageSelected: UIImage
    @Binding var sourceType: UIImagePickerController.SourceType
    
    // 2. The ImagePicker is going to return us an UIImagePickerController and convert it from UI Kit to SwiftUI
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator // 3. In our UIImagePickerController we set our coordinator to our custom coordinator called: ImagePickerCoordinator
        picker.sourceType = sourceType
        picker.allowsEditing = true // This allows you to crop or edit an image after you've selected it
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {}
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(parent: self)
    }
    
    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        
        // 4.   In our custom co-ordinator we are checking that we selected some media, if its either edited or original,
        //      we set our variable called imageSelected to be this image
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                
                // select the image for our app
                parent.imageSelected = image
                
                // dismiss the screen
                parent.presentationMode.wrappedValue.dismiss()
                // 5.   Finally we dismiss our screen
            }
        }
    }
}
