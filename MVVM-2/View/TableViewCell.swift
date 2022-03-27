//
//  TableViewCell.swift
//  MVVM-2
//
//  Created by Александр Дергилёв on 25.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            fullnameLabel.text = viewModel?.fullName
            ageLabel.text = viewModel?.age
        }
    }
}
