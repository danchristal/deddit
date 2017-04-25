//
//  PostStore.swift
//  deddit
//
//  Created by Dan Christal on 2017-04-20.
//  Copyright © 2017 Dan Christal. All rights reserved.
//

import UIKit

enum PostsResult {
    case success([Post])
    case failure(Error)
}

enum PostError: Error {
    case postCreationError
}

class PostStore {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchFunnyPosts(completion: @escaping(PostsResult) -> Void) {
        
        let url = RedditAPI.funnyPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            self.processPostsRequest(data: data, error: error, completion: { (result) in
                OperationQueue.main.addOperation {
                    completion(result)
                }
            })
            
        }
        task.resume()
    }
    
    private func processPostsRequest(data: Data?, error: Error?, completion: @escaping(PostsResult) -> Void) {
 
        
        guard let jsonData = data else {
            completion(.failure(error!))
            return
        }
        
        
        let result = RedditAPI.posts(fromJson: jsonData)
        
        completion(result)
        
    }
}
