//
//  ViewModel.swift
//  MVVM-3
//
//  Created by Александр Дергилёв on 27.03.2022.
//

import Foundation

class ViewModel: NSObject {
    @IBOutlet weak var networkManager: NetworkManager!
    
    private var movies: [String]?
    
    func fetchMovies(completion: @escaping () -> ()) {
        networkManager.fetchMovies { [weak self] movies in
            self?.movies = movies
            completion()
        }
    }
    
    func numberOfRowsInSection() -> Int {
        movies?.count ?? 0
    }
    
    func titleForCell(atIndexPath indexPath: IndexPath) -> String {
        guard let movies = movies else {
            return ""
        }
        
        return movies[indexPath.row]
    }
}
