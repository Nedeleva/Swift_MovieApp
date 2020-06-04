//
//  Movie.swift
//  Films
//
//  Created by Делитель нуля on 5/29/20.
//  Copyright © 2020 Делитель нуля. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    let voteCount: Int
    let voteAverage: Double
    let releaseDate: String
    
    init (id: Int, title: String, overview: String, posterPath: String, backdropPath: String, voteCount: Int, voteAverage: Double, releaseDate: String) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.voteCount = voteCount
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
    }
}
