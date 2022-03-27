//
//  ViewController.swift
//  MVC
//
//  Created by Александр Дергилёв on 24.03.2022.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommentNetwrokService.getComments { response in
            self.comments = response.comments
            self.tableView.reloadData()
        }
    }
}

extension CommentsViewController: UITableViewDelegate {
    
}

extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CommentCell
        cell.configure(with: comments[indexPath.row])
        return cell
    }
}
