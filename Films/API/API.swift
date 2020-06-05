
//
//  API.swift
//  Films
//
//  Created by Делитель нуля on 5/29/20.
//  Copyright © 2020 Делитель нуля. All rights reserved.
//

import Foundation
import Alamofire

let baseUrl = "https://api.themoviedb.org/3/movie/"
let posterUrl = "https://image.tmdb.org/t/p/original"
let apiKey = "d89884f21ecad35fd59f71ce10900b70"
let coder = JSONDecoder()

class API{
     class func fetchMovies(movies: String, page: Int, onSucces: @escaping (Results) -> Void){
        coder.keyDecodingStrategy = .convertFromSnakeCase
    let urlStr = "\(baseUrl)\(movies)?api_key=\(apiKey)&page=\(page)"
        guard let url = URL(string: urlStr) else {
            return}
        AF.request(url).response {
            responce in
            switch responce.result{
            case .success(let data):
                guard let data = data else {return}
//                do {
//                    let results = try self.coder.decode(Results.self, from: data)
//                    print(results)
//                } catch let error {
//                    print(error)
//                }
                
                guard let results = try? coder.decode(Results.self, from: data) else {
                    return}
                DispatchQueue.main.async {
                    onSucces(results)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
