//
//  UploadView.swift
//  DogGram
//
//  Created by Shaun Reddiar on 2021/09/04.
//

import SwiftUI
import UIKit

struct UploadView: View {
    @State var showImagePicker: Bool = false
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    @State var showPostImageView: Bool = false;
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    sourceType = UIImagePickerController.SourceType.camera
                    showImagePicker.toggle()
                }, label: {
                    Text("Take photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.yellowColor)
                })
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.MyTheme.purpleColor)
                
                Button(action: {
                    sourceType = UIImagePickerController.SourceType.photoLibrary
                    showImagePicker.toggle()
                }, label: {
                    Text("Import photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.purpleColor)
                })
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.MyTheme.yellowColor)
            }
            .sheet(isPresented: $showImagePicker, onDismiss: segueToPostImageView, content: {
                ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
                    .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
                    .preferredColorScheme(colorScheme)
            })
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(radius: 12)
                .fullScreenCover(isPresented: $showPostImageView, content: {
                    PostImageView(imageSelected: $imageSelected)
                        .preferredColorScheme(colorScheme)
                })
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    // MARK: FUNCTIONS
    func segueToPostImageView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showPostImageView.toggle()
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
            .preferredColorScheme(.dark)
    }
}
