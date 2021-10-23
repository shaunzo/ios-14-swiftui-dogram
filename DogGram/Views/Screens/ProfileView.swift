//
//  ProfileView.swift
//  DogGram
//
//  Created by Shaun Reddiar on 2021/10/02.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
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
                .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
            .opacity(isMyProfile ? 1.0 : 0.0)
        )
        .sheet(
            isPresented: $showSettings,
            content: {
                    SettingsView()
                    .preferredColorScheme(colorScheme)
            }
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(profileDisplayName: "Joe", isMyProfile: true, profileUserID: "")
                .preferredColorScheme(.dark)
        }
    }
}
