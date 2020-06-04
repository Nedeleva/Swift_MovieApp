//
//  MovieInfoViewController.swift
//  Films
//
//  Created by Делитель нуля on 6/5/20.
//  Copyright © 2020 Делитель нуля. All rights reserved.
//

import UIKit

class MovieInfoViewController: UIViewController {

    @IBOutlet weak var posterInfoImage: UIImageView!
    @IBOutlet weak var titleInfo: UILabel!
    @IBOutlet weak var dateInfo: UILabel!
    @IBOutlet weak var rateInfo: UILabel!
    @IBOutlet weak var overviewInfo: UILabel!
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
        titleInfo.text = movie.title
        dateInfo.text = movie.releaseDate
        rateInfo.text = String (movie.voteAverage)
        posterInfoImage.kf.setImage(with: URL(string: posterUrl + movie.posterPath))
        overviewInfo.text = movie.overview
    }

}
