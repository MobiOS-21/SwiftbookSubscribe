//
//  LocalDataFetcher.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Александр Дергилёв on 29.03.2022.
//  Copyright © 2022 Алексей Пархоменко. All rights reserved.
//

import Foundation
class LocalDataFetcher: NetworkDataFetcher {
    override func fetchGenericJSONData<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable {
        guard let file = Bundle.main.url(forResource: urlString, withExtension: nil) else {
            print("Couldn't file urlString in Bundle")
            response(nil)
            return
        }
        
        let data = try? Data(contentsOf: file)
        let decoded = self.decodeJSON(type: T.self, from: data)
        response(decoded)
    }
}
