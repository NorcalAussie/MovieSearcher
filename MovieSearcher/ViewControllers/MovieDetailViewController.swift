//
//  MovieDetailViewController.swift
//  MovieSearcher
//
//  Created by Matthew Pearce on 3/19/20.
//  Copyright © 2020 Matthew Pearce. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var detailsTableView: UITableView!
    
    var movie: Result?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let movie = movie else {
            fatalError("Detial VC needs a movie")
        }
        
        detailsTableView.tableFooterView = UIView()
        
        print(movie)
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "movie_details_cell", for: indexPath) as! MovieDetailsTableViewCell
            cell.coverImageView.image = image
            cell.nameLabel.text = movie!.title ?? "-"
            cell.yearLabel.text = movie!.releaseDate ?? "-"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "movie_overview_cell", for: indexPath) as! MovieOverviewTableViewCell
            cell.overviewLabel.text = movie!.overview ?? "-"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 120.0
        } else {
            return UITableView.automaticDimension
        }
    }
}
