//
//  TableViewCellViewModelType.swift
//  MVVM-2
//
//  Created by Александр Дергилёв on 25.03.2022.
//

import Foundation

protocol TableViewCellViewModelType: AnyObject {
    var fullName: String { get }
    var age: String { get }
}
