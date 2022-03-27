//
//  TableViewCellViewModel.swift
//  MVVM-2
//
//  Created by Александр Дергилёв on 25.03.2022.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    var fullName: String {
        return profile.name + " " + profile.secondName
    }
    
    var age: String {
        return "\(profile.age)"
    }
    
    private var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
}
