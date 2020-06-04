//
//  MovieDetailViewController.swift
//  Films
//
//  Created by Inna Litvinenko on 04.06.2020.
//  Copyright © 2020 Делитель нуля. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearMovie: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var rateMovie: UILabel!
    @IBOutlet weak var overviewMovie: UILabel!
    
    var movie = Movie(id: 0,
                      title: "",
                      overview: "",
                      posterPath: "",
                      backdropPath: "",
                      voteCount: 0,
                      voteAverage: 0.0,
                      releaseDate: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = movie.title
        yearMovie.text = movie.releaseDate
        rateMovie.text = String (movie.voteAverage)
        posterImageView.kf.setImage(with: URL(string: posterUrl + movie.posterPath))
        overviewMovie.text = movie.overview
        
    }
    
}
