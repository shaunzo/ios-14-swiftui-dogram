//
//  SettingsEditTextView.swift
//  DogGram
//
//  Created by shaun reddiar on 2021/10/17.
//

import SwiftUI

struct SettingsEditTextView: View {
    
    @State var submissionText: String = ""
    
    var body: some View {
        VStack{
            Text("This is the description to tell the user what they are doing on this screen")
            TextField("Placeholder", text: $submissionText)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.MyTheme.beigeColor)
                .cornerRadius(12)
                .font(.headline)
                .autocapitalization(.sentences)
            
            Button(action: {
                
            }, label: {
                Text("Save".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
            })
                .accentColor(Color.MyTheme.yellowColor)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationBarTitle("Edit Display Name")
    }
}

struct SettingsEditTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsEditTextView()
        }
    }
}
