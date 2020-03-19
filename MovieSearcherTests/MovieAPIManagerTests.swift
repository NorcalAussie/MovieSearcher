//
//  MovieAPIManagerTests.swift
//  MovieSearcherTests
//
//  Created by Matthew Pearce on 3/19/20.
//  Copyright © 2020 Matthew Pearce. All rights reserved.
//

import XCTest
import OHHTTPStubs

@testable import MovieSearcher

class MovieAPIManagerTests: XCTestCase {
    
    private var apiManager: MovieAPIManager!

    override func setUp() {
        apiManager = MovieAPIManager()
        
    }

    override func tearDown() {
       
    }

    func testGetDataFromAPIReturnsData() {
//        stub(condition: isPath(<#T##path: String##String#>), response: <#T##HTTPStubsResponseBlock##HTTPStubsResponseBlock##(URLRequest) -> HTTPStubsResponse#>)
//
//        apiManager.getDatafromAPI(endpoint: APIEndpoint.movieQuery(query: "Something")) { (data, response, error) in
//
//
//        }
    }
}
