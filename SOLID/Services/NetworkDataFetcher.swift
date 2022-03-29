//
//  NetworkDataFetcher.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Александр Дергилёв on 28.03.2022.
//  Copyright © 2022 Алексей Пархоменко. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
}
class NetworkDataFetcher: DataFetcher {
    let networking: Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }

    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void) {
        print(T.self)
        networking.request(urlString: urlString) { data, error in
            if let error = error {
                print(error.localizedDescription)
                response(nil)
                return
            }

            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else {
            return nil
        }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch {
            print("Failed to decode JSON \(error.localizedDescription)")
            return nil
        }
    }
}
