//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by Александр Дергилёв on 25.03.2022.
//

import Foundation
protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
