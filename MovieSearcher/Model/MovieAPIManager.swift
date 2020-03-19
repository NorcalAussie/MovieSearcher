//
//  MovieAPIManager.swift
//  MovieSearcher
//
//  Created by Matthew Pearce on 3/19/20.
//  Copyright © 2020 Matthew Pearce. All rights reserved.
//

import Foundation

//https://api.themoviedb.org/3/search/movie?api_key=b11fc621b3f7f739cb79b50319915f1d&language=en-US&query=hitman&page=1&include_adult=false
//https://image.tmdb.org/t/p/original/1U2FpMotSyaciATw5qfEsKdgpX4.jpg

enum APIEndpoint {
    case image(imagePath: String)
    case movieQuery(query: String)
    
    func stringRespresentation() -> String {
        switch self {
        case let .image(imagePath: path):
            return "https://image.tmdb.org/t/p/original/\(path)"
        case let .movieQuery(query: queryString):
            return "https://api.themoviedb.org/3/search/movie?api_key=b11fc621b3f7f739cb79b50319915f1d&language=en-US&query=\(queryString)&page=1&include_adult=false"
        }
    }
}


class MovieAPIManager {
    
    func getMovies(query: String, completion: @escaping (_ response: MovieResponse?, _ error: Error?) -> Void) {
        let endpoint = APIEndpoint.movieQuery(query: query)
        
        getDatafromAPI(endpoint: endpoint) { (data, response, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            if let data = data {
                let response = try? JSONDecoder().decode(MovieResponse.self, from: data)
                completion(response, nil)
            }
        }
    }
    
    func getCoverImage(path: String, completion: @escaping (_ imageData: Data?,_ imageURL: String) -> Void) {
        let endpoint = APIEndpoint.image(imagePath: path)
        
        getDatafromAPI(endpoint: endpoint) { (data, response, error) in
            var imageURL: String = ""
            if let response = response, let url = response.url {
                imageURL = url.absoluteString
            }
            
            completion(data, imageURL)
        }
    }
    
    func getDatafromAPI(endpoint: APIEndpoint, completion: @escaping (_ data: Data?,_ response: URLResponse?, _ error: Error?) -> Void) {
        let session = URLSession.shared
        
        let endpointURL = endpoint.stringRespresentation().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let request = URLRequest(url: URL(string: endpointURL!)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }
        
        dataTask.resume()
    }
}


