//
//  RedditAPI.swift
//  deddit
//
//  Created by Dan Christal on 2017-04-25.
//  Copyright © 2017 Dan Christal. All rights reserved.
//

import UIKit

enum RedditError: Error {
    case invalidJsonData
}

enum Method: String {
    case funny = "https://www.reddit.com/r/funny/.json"
}

struct RedditAPI {
    
    static var funnyPhotosURL: URL {
        return redditURL(method: .funny)
    }

    private static func redditURL(method: Method) -> URL {
        return URL(string: method.rawValue)!
    }

    static func posts(fromJson data: Data) -> PostsResult {
    
        do{
            
            guard let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any],
            let dataDict = jsonData["data"] as? [String:Any], let childrenArray = dataDict["children"] as? [[String:Any]] else {
                    return .failure(RedditError.invalidJsonData)
            }
            
            var finalPosts = [Post]()
            
            for postItem in childrenArray {
                if let postData = postItem["data"] as? [String:Any],
                let post = post(from: postData) {
                    finalPosts.append(post)
                }
            }
            
            if finalPosts.isEmpty && !childrenArray.isEmpty {
                //unable to process posts, json structure has changed
                return .failure(RedditError.invalidJsonData)
            }
            
            return .success(finalPosts)
            
        } catch let error {
            return PostsResult.failure(error)
        }
    }
    
    private static func post(from json: [String:Any]) -> Post? {
        guard let title = json["title"] as? String,
            let author = json["author"] as? String,
            let imageUrlString = json["url"] as? String,
            let commentsUrlString = json["permalink"] as? String,
            let imageUrl = URL(string: imageUrlString),
            let commentsUrl = URL(string: commentsUrlString) else {return nil}
        
        
        return Post(title: title, author: author, imageUrl: imageUrl, commentsUrl: commentsUrl)
    }
    
}
