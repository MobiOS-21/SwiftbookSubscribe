//
//  DataFetcherService.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Александр Дергилёв on 29.03.2022.
//  Copyright © 2022 Алексей Пархоменко. All rights reserved.
//

import Foundation

class DataFetcherService {
    let networkDataFetcher: DataFetcher
    let localDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher(), localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
        self.localDataFetcher = localDataFetcher
    }
    
    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        let urlFreeGames = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlFreeGames, response: completion)
    }
    
    func fetchPaidGames(completion: @escaping (AppGroup?) -> Void) {
        let urlTopPaidGames = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/10/apps.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlTopPaidGames, response: completion)
    }
    
    func fetchComments(completion: @escaping ([Comment]?) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts/1/comments"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
    func fetchLocalComment(completion: @escaping ([Comment]?) -> Void) {
        let localUrlString = "userAPI.txt"
        localDataFetcher.fetchGenericJSONData(urlString: localUrlString, response: completion)
    }
}
