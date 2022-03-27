//
//  GetCommentResponse.swift
//  MVC
//
//  Created by Александр Дергилёв on 24.03.2022.
//

import Foundation

struct GetCommentResponse {
    typealias JSON = [String: AnyObject]
    let comments: [Comment]
    
    init(json: Any) throws {
        guard let array = json as? [JSON] else {
            throw NetworkError.failInternetError
        }
        
        var comments = [Comment]()
        
        for dict in array {
            guard let comment = Comment(dict: dict) else {
                continue
            }
            comments.append(comment)
        }
        self.comments = comments
    }
}
