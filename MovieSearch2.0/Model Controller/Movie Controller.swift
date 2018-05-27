//
//  Movie Controller.swift
//  MovieSearch2.0
//
//  Created by Adam on 26/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class MovieController {
    
    // Static BaseURL
    static let baseURL = URL(string: "https://api.themoviedb.org/")
    // fetchData
    static func fetchMovies(searchTerm: String, compeletion: @escaping (([Movie]?) -> Void)) {
        //URL
        guard var url = baseURL else { compeletion(nil) ; return }
        url.appendPathComponent("3")
        url.appendPathComponent("search")
        url.appendPathComponent("movie")
            //Queries
                //Step 1 - Get URL Components
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
                //Step 2 - Get array of query items
        let apiQuery = URLQueryItem(name: "api_key", value: "e421b7fad84772dcaa7c369581a802ab")
        let movieQuery = URLQueryItem(name: "query", value: searchTerm)
                //Step 3 - Combine step1 and step2, aka build query array and add to the components
        let queryArray = [apiQuery, movieQuery]
        components?.queryItems = queryArray
                //Step 4 - Create fully constructed URL
        guard let finalUrl = components?.url else { compeletion(nil) ; return}
        print("📡📡📡\(finalUrl.absoluteString)📡📡📡")
        //Request
        //URLSession DataTask + Resume + decode data
    }
    // fetchImage
}













































