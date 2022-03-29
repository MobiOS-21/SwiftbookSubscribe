//
//  DataStore.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Александр Дергилёв on 28.03.2022.
//  Copyright © 2022 Алексей Пархоменко. All rights reserved.
//

import Foundation

class DataStore {
    func saveNameInCache(name: String) {
        print("name")
    }
    
    func getNameFromCache() -> String {
        return "Some name"
    }

}
