//
//  ViewController.swift
//  MVVM
//
//  Created by Александр Дергилёв on 25.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var viewModel: ViewModel! {
        didSet {
            self.nameLabel.text = viewModel.name
            self.secondNameLabel.text = viewModel.secondName
            self.ageLabel.text = viewModel.age
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
    }


}

