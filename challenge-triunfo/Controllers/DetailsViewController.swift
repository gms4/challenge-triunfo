//
//  DetailsViewController.swift
//  challenge-triunfo
//
//  Created by Guilherme Souza on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        guard let movie = movie else {
            return
        }
        
        self.title = movie.title
        
        Task {
            
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            self.backdropImage.image = imagem
            
        }
        backdropImage.image = UIImage(named: movie.backdropPath)
        titleLabel.text = movie.title
        
        Task {
            
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            self.posterImage.image = imagem
            
        }
        
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
    }
    
}
