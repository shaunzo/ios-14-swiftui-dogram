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
                    /*@START_MENU_TOKEN@*/Text("Content")/*@END_MENU_TOKEN@*/
                })
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
