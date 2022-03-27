//
//  NetworkManager.swift
//  MVVM-3
//
//  Created by Александр Дергилёв on 27.03.2022.
//

import Foundation

class NetworkManager: NSObject {
    func fetchMovies(completion: ([String]) -> ()) {
        completion(["movie 1", "movie 2", "movie 3"])
    }
}
