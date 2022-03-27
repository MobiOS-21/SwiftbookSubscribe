//
//  ViewModel.swift
//  MVVM-1
//
//  Created by Александр Дергилёв on 25.03.2022.
//

import Foundation

class ViewModel {
    private var profile = Profile(name: "aleksandr", secondName: "Dergilev", age: 25)
    
    var name: String {
        return profile.name
    }
    
    var secondName: String {
        return profile.secondName
    }
    
    var age: String {
        return String(profile.age)
    }
}
