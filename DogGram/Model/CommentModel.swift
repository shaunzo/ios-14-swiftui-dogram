//
//  CommentModel.swift
//  DogGram
//
//  Created by Shaun Reddiar on 2021/08/28.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable {
    var id = UUID()
    var commentID: String // ID for the comment in the database
    var userID: String // ID for the user in teh database
    var userName: String // username for the user in teh database
    var content: String // comment text
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
