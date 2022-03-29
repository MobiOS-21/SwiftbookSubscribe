//
//  AppGroup.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Александр Дергилёв on 28.03.2022.
//  Copyright © 2022 Алексей Пархоменко. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let artistName: String
    let name: String
    let id: String
}
