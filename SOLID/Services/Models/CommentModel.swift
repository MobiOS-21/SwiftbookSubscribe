//
//  CommentModel.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Александр Дергилёв on 28.03.2022.
//  Copyright © 2022 Алексей Пархоменко. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
