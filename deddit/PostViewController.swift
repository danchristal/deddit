//
//  PostViewController.swift
//  deddit
//
//  Created by Dan Christal on 2017-04-20.
//  Copyright © 2017 Dan Christal. All rights reserved.
//

import UIKit

class PostViewController: UITableViewController {
    
    var store: PostStore!
    let postDataSource = PostDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = postDataSource
        tableView.register(PostViewCell.self, forCellReuseIdentifier: "PostViewCell")
        
        store.fetchFunnyPosts { (result) in
            switch result {
            case let .success(posts):
                self.postDataSource.posts = posts
                self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            case let .failure(error):
                print("Error fetching posts: \(error)")
                self.postDataSource.posts.removeAll()
            }
            
        }
    }
    
}
