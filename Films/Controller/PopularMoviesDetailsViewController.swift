//
//  PopularMoviesDetailsViewController.swift
//  Films
//
//  Created by Делитель нуля on 6/3/20.
//  Copyright © 2020 Делитель нуля. All rights reserved.
//

import UIKit

class PopularMoviesDetailsViewController: UIViewController {
    var image: UIImage?
    var movie: Movie!
        
        @IBOutlet weak var popularPhotoImageView: UIImageView!
        @IBOutlet weak var titlePopularMovie: UILabel!
        @IBOutlet weak var overviewPopularMovies: UILabel!
        private let identifier = "MovieCell"
        override func viewDidLoad() {
            super.viewDidLoad()
            popularPhotoImageView.image = image
            titlePopularMovie.text = title
           // overviewPopularMovies.text = overview
        }
    }
