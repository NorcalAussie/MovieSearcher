//
//  MovieTableCellViewModelTests.swift
//  MovieSearcherTests
//
//  Created by Matthew Pearce on 3/19/20.
//  Copyright © 2020 Matthew Pearce. All rights reserved.
//

import XCTest

@testable import MovieSearcher

class MockAPIManager: MovieAPIManager {
    var mockData: Data?
    var queryString: String?
    var error: Error?
    var movieResponse: MovieResponse?
    
    override func getCoverImage(path: String, completion: @escaping (Data?, String) -> Void) {
        completion(mockData, "")
    }
    
    override func getMovies(query: String, completion: @escaping (MovieResponse?, Error?) -> Void) {
        queryString = query
        completion(movieResponse, error)
    }
}

class MovieTableCellViewModelTests: XCTestCase {
    
    var viewModel: MovieTableViewCellViewModel!

    override func setUp() {
        
    }

    override func tearDown() {
       
    }

    func testMovieTitleTextIsCorrect() {
        let movie = Result(popularity: nil, voteCount: nil, video: nil, posterPath: nil, id: nil, adult: nil, backdropPath: nil, originalTitle: nil, genreIDS: nil, title: "Star Wars", voteAverage: nil, overview: nil, releaseDate: nil)
        viewModel = MovieTableViewCellViewModel(movie: movie)
        
        XCTAssertEqual(viewModel.movieTitleText, "Star Wars")
    }
    
    func testLoadCoverReturnsData() {
        let mockManager = MockAPIManager()
        mockManager.mockData = "something".data(using: .utf8)
        
        let movie = Result(popularity: nil, voteCount: nil, video: nil, posterPath: "", id: nil, adult: nil, backdropPath: nil, originalTitle: nil, genreIDS: nil, title: "Star Wars", voteAverage: nil, overview: nil, releaseDate: nil)
        viewModel = MovieTableViewCellViewModel(movie: movie, apiManager: mockManager)
        
        viewModel.loadCover { (image) in
            
        }
    }
}
