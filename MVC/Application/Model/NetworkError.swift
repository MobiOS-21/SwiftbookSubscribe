//
//  NetworkError.swift
//  MVC
//
//  Created by Александр Дергилёв on 24.03.2022.
//

import Foundation

enum NetworkError: Error {
    case failInternetError
    case noInternetConnection
}
