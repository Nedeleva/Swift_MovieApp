//
//  TopRatedViewController.swift
//  Films
//
//  Created by Делитель нуля on 5/30/20.
//  Copyright © 2020 Делитель нуля. All rights reserved.
//

import UIKit

private let identifier = "TopRated"

class TopRatedViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    private var movies: [Movie]?
    private var page: Int = 1
    private var totalPages: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = CGSize(width: width, height: 190)
        
        fetch()
    }
    
    private func fetch(_page: Int = 1){
        API.fetchMovies(movies: "top_rated", page: page) { data in
            self.totalPages = data.totalPages
            self.movies = data.results
            self.collectionView.reloadData()
        }
    }
    
    private func loadMoreData() {
        if page < totalPages {
            page += 1
            OperationQueue.main.addOperation {
                API.fetchMovies(movies: "top_rated", page: self.page){ data in
                    self.movies! += data.results
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension TopRatedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MovieCollectionViewCell
        cell.movie = movies?[indexPath.item]
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
      guard let count = movies?.count else {fatalError() }
      
      if indexPath.item == count - 1 {
          self.loadMoreData()
      }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "MovieInfoStoryboard", bundle: nil)
        let movieInfoViewController = storyboard.instantiateViewController(withIdentifier: "MovieInfoViewController") as? MovieInfoViewController
        guard let movie = movies?[indexPath.row] else {return}
        movieInfoViewController?.movie = movie
        self.navigationController?.pushViewController(movieInfoViewController ?? self, animated: true)
    }
}
