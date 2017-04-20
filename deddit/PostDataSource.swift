//
//  PostDataSource.swift
//  deddit
//
//  Created by Dan Christal on 2017-04-20.
//  Copyright © 2017 Dan Christal. All rights reserved.
//

import UIKit

class PostDataSource: NSObject, UITableViewDataSource {
    
    var posts = [Post]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostViewCell", for: indexPath)
        
        return cell
    }
}
