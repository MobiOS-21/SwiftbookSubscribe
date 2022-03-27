//
//  DetailViewController.swift
//  MVVM-2
//
//  Created by Александр Дергилёв on 27.03.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var viewModel: DetailViewModelType?
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.age.bind(listener: { [unowned self] in
            guard let age = $0 else { return }
            self.textLabel.text = age
        })
        
        delay(delay: 5) { [unowned self] in
            self.viewModel?.age.value = "some new value"
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else {
            return
        }

        self.textLabel.text = viewModel.description
    }
    
    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: closure)
    }
}
