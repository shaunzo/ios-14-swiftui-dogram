//
//  PostModel.swift
//  DogGram
//
//  Created by Shaun Reddiar on 2021/08/28.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
    var id = UUID()
    var postID: String // for the post in our database
    var userID: String // ID for user in DB
    var username: String // Username of user in DB
    var caption: String?
    var dateCreated: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
