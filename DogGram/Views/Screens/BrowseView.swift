//
//  BrowseView.swift
//  DogGram
//
//  Created by Shaun Reddiar on 2021/08/28.
//

import SwiftUI

struct BrowseView: View {
    
    var posts = PostArrayObject()
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
            CarouselView()
            ImageGridView(posts: posts)
        })
        .navigationBarTitle("Browse")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BrowseView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            BrowseView()
        }
    }
}
