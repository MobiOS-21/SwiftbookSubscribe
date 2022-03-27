//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Александр Дергилёв on 25.03.2022.
//

import Foundation

class ViewModel: TableViewViewModelType {
    var profiles = [Profile(name: "Jonh", secondName: "Smith", age: 33),
                Profile(name: "Max", secondName: "Kolby", age: 21),
                Profile(name: "Mark", secondName: "Selman", age: 55)]

    private var selectedIndexPath: IndexPath?
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else {
            return nil
        }

        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
}
