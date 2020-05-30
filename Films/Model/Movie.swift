//
//  Movie.swift
//  Films
//
//  Created by Делитель нуля on 5/29/20.
//  Copyright © 2020 Делитель нуля. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    let voteCount: Int
    let voteAverage: Double
    let releaseDate: String
}
