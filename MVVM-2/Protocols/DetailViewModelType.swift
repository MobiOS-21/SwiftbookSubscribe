//
//  DetailViewModelType.swift
//  MVVM-2
//
//  Created by Александр Дергилёв on 27.03.2022.
//

import Foundation

protocol DetailViewModelType {
    var description: String { get }
    var age: Box<String?> { get }
}
