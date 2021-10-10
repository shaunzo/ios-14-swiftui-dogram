//
//  SettingsView.swift
//  DogGram
//
//  Created by Shaun Reddiar on 2021/10/10.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                GroupBox(label: SettingsLabelView(labelText: "DogGram", labelImage: "dot.radiowaves.left.and.right"), content: {
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, alignment: .center)
                            .cornerRadius(12)
                        Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are a dog-loving community and we are happy to have you!")
                            .font(.footnote)
                    })
                })
                .padding()
            })
            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                     }, label: {
                        Image(systemName: "xmark")
                            .font(.title)
                     })
                    .accentColor(.primary)
            )
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
