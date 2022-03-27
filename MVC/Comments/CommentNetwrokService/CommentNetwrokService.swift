//
//  CommentNetwrokService.swift
//  MVC
//
//  Created by Александр Дергилёв on 24.03.2022.
//

import Foundation

class CommentNetwrokService {
    private init() {}
    
    static func getComments(completion: @escaping (GetCommentResponse) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        NetworkService.shared.getData(url: url) { json in
            do {
               let response = try GetCommentResponse(json: json)
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
