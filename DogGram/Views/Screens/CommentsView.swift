//
//  CommentsView.swift
//  DogGram
//
//  Created by Shaun Reddiar on 2021/08/28.
//

import SwiftUI

struct CommentsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var submissionText: String = ""
    @State var commentArray = [CommentModel]()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(commentArray, id: \.self) { comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("Add a comment here", text: $submissionText)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                })
                    .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor )
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 6)
        }
        .padding(.horizontal)
        .navigationBarTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            getComments()
        })
    }
    
    // MARK: FUNCTIONS
    func getComments() {
        
        print("GET COMMENTS FROM DATABASE")
        
        
        let comment1 = CommentModel(commentID: "", userID: "", userName: "Joe Green", content: "This is the first comment", dateCreated: Date())
        
        let comment2 = CommentModel(commentID: "", userID: "", userName: "Alex", content: "This is the second comment", dateCreated: Date())
        
        let comment3 = CommentModel(commentID: "", userID: "", userName: "Stephany", content: "This is the third comment", dateCreated: Date())
        
        let comment4 = CommentModel(commentID: "", userID: "", userName: "Christopher", content: "This is the fourth comment", dateCreated: Date())
        
        self.commentArray.append(comment1)
        self.commentArray.append(comment2)
        self.commentArray.append(comment3)
        self.commentArray.append(comment4)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView()
                .preferredColorScheme(.dark)
        }
    }
}
