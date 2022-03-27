//
//  DetailViewModel.swift
//  MVVM-2
//
//  Created by Александр Дергилёв on 27.03.2022.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    var age: Box<String?> = Box(value: nil)
    
    private var profile: Profile
    var description: String {
        return profile.name + " " + profile.secondName + " \(profile.age)"
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
