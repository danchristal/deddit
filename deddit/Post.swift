//
//  Post.swift
//  deddit
//
//  Created by Dan Christal on 2017-04-20.
//  Copyright © 2017 Dan Christal. All rights reserved.
//

import UIKit

class Post {
    let title: String
    let author: String
    let imageUrl: URL
    let commentsUrl: URL
    
    init(title: String, author: String, imageUrl: URL, commentsUrl: URL) {
        self.title = title
        self.author = author
        self.imageUrl = imageUrl
        self.commentsUrl = commentsUrl
    }
}
