//
//  ViewController.swift
//  MovieSearcher
//
//  Created by Matthew Pearce on 3/19/20.
//  Copyright © 2020 Matthew Pearce. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    
    let movieAPIManager: MovieAPIManager = MovieAPIManager()
    
    var moviesTableViewDataSource: [Result] = [] {
        didSet {
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        moviesTableView.tableFooterView = UIView()
        searchBar.delegate = self
    }
    
    fileprivate func queryForMovies(query: String) {
        movieAPIManager.getMovies(query: query) { (moviesResponse, error) in
            guard error == nil else {
                print("APIManager returned an error: \(error)")
                return
            }
            
            if let results = moviesResponse?.results {
                self.moviesTableViewDataSource = results
            } else {
                self.moviesTableViewDataSource = []
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesTableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie_cell", for: indexPath) as! MovieTableViewCell
        
        let result = moviesTableViewDataSource[indexPath.row]
        cell.viewModel = MovieTableViewCellViewModel(movie: result, apiManager: movieAPIManager)
        
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            queryForMovies(query: searchText)
        } else {
            moviesTableViewDataSource = []
        }
    }
}

