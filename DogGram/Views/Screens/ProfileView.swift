//
//  ProfileView.swift
//  DogGram
//
//  Created by Shaun Reddiar on 2021/10/02.
//

import SwiftUI

struct ProfileView: View {
    
    @State var profileDisplayName: String
    var isMyProfile: Bool
    var profileUserID: String
    var posts = PostArrayObject()
    
    @State var showSettings: Bool = false
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            ImageGridView(posts: posts)
        })
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing:
                Button(
                    action: {
                        showSettings.toggle()
                        },
                    label: {
                        Image(systemName: "line.horizontal.3")
                        }
                )
            .accentColor(Color.MyTheme.purpleColor)
            .opacity(isMyProfile ? 1.0 : 0.0)
        )
        .sheet(
            isPresented: $showSettings,
            content: {
                    SettingsView()
            }
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(profileDisplayName: "Joe", isMyProfile: true, profileUserID: "")
        }
    }
}
