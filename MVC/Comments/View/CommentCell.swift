//
//  CommentCell.swift
//  MVC
//
//  Created by Александр Дергилёв on 24.03.2022.
//

import UIKit

class CommentCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    func configure(with comment: Comment) {
        label.text = comment.name
        textView.text = comment.body
    }
}
