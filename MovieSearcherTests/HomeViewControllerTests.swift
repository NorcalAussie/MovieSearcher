//
//  HomeViewControllerTests.swift
//  MovieSearcherTests
//
//  Created by Matthew Pearce on 3/19/20.
//  Copyright © 2020 Matthew Pearce. All rights reserved.
//

import XCTest
@testable import MovieSearcher


class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!
    var moviesTableView: UITableView!
    
    override func setUp() {
        sut = HomeViewController()
        moviesTableView = UITableView()
        sut.moviesTableView = moviesTableView
    }

    override func tearDown() {
   
    }
    
    func testQueryForMoviesReturnsData() {
        let results = [Result(popularity: nil, voteCount: nil, video: nil, posterPath: "", id: nil, adult: nil, backdropPath: nil, originalTitle: nil, genreIDS: nil, title: "Star Wars", voteAverage: nil, overview: nil, releaseDate: nil)]
        let movieResponse = MovieResponse(results: results)
        
        let mockAPIManager = MockAPIManager()
        mockAPIManager.movieResponse = movieResponse
        
        sut.movieAPIManager = mockAPIManager
        sut.queryForMovies(query: "Star Wars")
        
        XCTAssertEqual(sut.moviesTableViewDataSource.count, 1)
        XCTAssertEqual(mockAPIManager.queryString, "Star Wars")
    }
}
