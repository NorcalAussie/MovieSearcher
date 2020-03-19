//
//  MovieTableViewCellViewModel.swift
//  MovieSearcher
//
//  Created by Matthew Pearce on 3/19/20.
//  Copyright © 2020 Matthew Pearce. All rights reserved.
//

import Foundation
import UIKit

class MovieTableViewCellViewModel {
    var movie: Result
    
    var apiManager: MovieAPIManager!
    
    init(movie: Result, apiManager: MovieAPIManager = MovieAPIManager()) {
        self.movie = movie
        self.apiManager = apiManager
    }
    
    var movieTitleText: String {
        return movie.title ?? "-"
    }
    
    var releaseText: String {
        if let releaseDateString = movie.releaseDate {
        
            let inputDF = DateFormatter()
            inputDF.dateFormat = "yyyy-mm-dd"
            
            let outputDF = DateFormatter()
            outputDF.dateFormat = "MMMM yyyy"
            
            if let releaseDate = inputDF.date(from: releaseDateString) {
                let formattedDate = outputDF.string(from: releaseDate)
                
                return formattedDate
            } else {
                return releaseDateString
            }
        } else {
            return "-"
        }
    }
    
    func loadCover(completion: @escaping (_ image: UIImage?) -> Void) {
        if let path = movie.posterPath {
            apiManager.getCoverImage(path: path) { (data) in
                if let data = data {
                    let image = UIImage(data: data)
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        } else {
            completion(nil)
        }
    }
}
