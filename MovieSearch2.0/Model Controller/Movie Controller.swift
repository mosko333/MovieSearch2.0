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
        var request = URLRequest(url: finalUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        //URLSession DataTask + Resume + decode data
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("❌Error with dataTask: \(error.localizedDescription)")
                compeletion(nil) ; return
            }
            guard let data = data else { compeletion(nil) ; return }
            let jsonDecoder = JSONDecoder()
            do {
                let topLevelData = try jsonDecoder.decode(TopLevelData.self, from: data)
                let movies = topLevelData.results
                compeletion(movies) ; return
            } catch {
                print("❌ Error decoding data: \(error.localizedDescription)")
                compeletion(nil) ; return
            }
        }.resume()
    }
    // fetchImage
    static func fetchImage(imageString: String, completion: @escaping ((UIImage?) -> Void) {
        
        //URL
        let imageStringUrl = "http://image.tmdb.org/t/p/w500/" + imageString
        print()
        //Request
        //URLSession + Resume + decode data
    }
}













































