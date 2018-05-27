//
//  Movie.swift
//  MovieSearch2.0
//
//  Created by Adam on 26/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit


struct TopLevelData: Codable {
    // This moves from the top layer of the json down to the first dictionary that has a key 'results' which contains the array of movies
    let results: [Movie]
}

struct Movie: Codable {
    // Use and enum to get rid of the snake case
    enum CodingKeys: String, CodingKey {
        case title
        case rating = "vote_average"
        case summary = "overview"
        case imageString = "poster_path"
    }
    // Set up properties
    var title: String? = "Title could not be found"
    var rating: Double?
    var summary: String? = "Summery could not be found"
    var imageString: String?
}
