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
    }
    
}
