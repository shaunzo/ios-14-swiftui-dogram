//
//  PostView.swift
//  DogGram
//
//  Created by Shaun Reddiar on 2021/08/27.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    @State var showHeaderandFooter: Bool
    @State var animateLike: Bool = false
    @State var addHeartAnimationToView: Bool
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
            
            // MARK: HEADER
            if showHeaderandFooter {
                HStack {
                    
                    NavigationLink(
                        destination: ProfileView(profileDisplayName: post.username, isMyProfile: false, profileUserID: post.userID),
                        label: {
                            Image("dog1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30, alignment: .center)
                                .cornerRadius(15)
                            
                            Text(post.username)
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                        }
                    )
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .font(.headline)
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 6)
            }
            
            // MARK: IMAGE
            
            ZStack {
                Image("dog1")
                    .resizable()
                    .scaledToFit()
                
                if addHeartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
                
            }
            
            
            // MARK: FOOTER
            if showHeaderandFooter {
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                    
                    Button(
                        action: {
                            if post.likedByUser {
                                // Unlike post
                                unlikePost()
                            } else {
                                // like post
                                likePost()
                            }
                        },
                        label: {
                            Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                                .font(.title3)
                        }
                    )
                    .accentColor(post.likedByUser ? .red : .primary)
                    
                    // MARK: COMMENT ICON
                    NavigationLink(
                        destination: CommentsView(),
                        label: {
                            Image(systemName: "bubble.middle.bottom")
                                .font(.title3)
                                .foregroundColor(.primary)
                        })
                    Image(systemName: "paperplane")
                        .font(.title3)
                    
                    Spacer()
                })
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 6)
                
                // caption is an optional prop so we add a conditional
                if let caption = post.caption {
                    HStack {
                        Text(caption)
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 6)
                }
            }
        })
    }
    
    // MARK: FUNCTIONS
    func likePost() {
        let updatedPost = PostModel(
            postID: post.postID,
            userID: post.userID,
            username: post.username,
            caption: post.caption,
            dateCreated: post.dateCreated,
            likeCount: post.likeCount + 1,
            likedByUser: true)
        
        self.post = updatedPost
        
        animateLike = true
        
        // This will delay teh next line of code by 0.5s
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            animateLike = false
        }
    }
    
    func unlikePost() {
        let updatedPost = PostModel(
            postID: post.postID,
            userID: post.userID,
            username: post.username,
            caption: post.caption,
            dateCreated: post.dateCreated,
            likeCount: post.likeCount - 1,
            likedByUser: false)
        
        self.post = updatedPost
    }
}

struct PostView_Previews: PreviewProvider {
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Joe Green", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
    
    static var previews: some View {
        PostView(
            post: post,
            showHeaderandFooter: true,
            addHeartAnimationToView: true)
        .previewLayout(.sizeThatFits)
    }
}
