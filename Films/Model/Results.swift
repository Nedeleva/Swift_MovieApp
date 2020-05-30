//
//  Results.swift
//  Films
//
//  Created by Делитель нуля on 5/29/20.
//  Copyright © 2020 Делитель нуля. All rights reserved.
//

import Foundation

struct Results: Codable {
    let results: [Movie]
    let page: Int
    let totalPages: Int
    let totalResults: Int
    
}
