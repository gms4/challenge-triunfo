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
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var runtimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        guard let movie = movie else {
            return
        }
        
        overrideUserInterfaceStyle = .dark
        
        self.title = movie.title
        
        Task {
            
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            self.backdropImage.image = imagem
            
        }
        
//        backdropImage.image = UIImage(named: movie.backdropPath)
        titleLabel.text = movie.title
        
        Task {
            
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            self.posterImage.image = imagem
            
        }
        
        Task {
            
            let data = await Movie.getDetailsAPI(id: movie.id)
            let time = "\(data.runtime/60)h \(data.runtime%60) min"
            let genreString = data.genres.map { genre in
                return genre.name
            }
            //print(genreString)
            var aux = ""
            //print(genreString.count)
            for i in 0...genreString.count - 1 {
                if i == genreString.count - 1 {
                    aux += genreString[i]
                } else {
                    aux += genreString[i] + ", \n"
                }
            }
            genreLabel.text = aux
            runtimeLabel.text = time
            
        }
        
//        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PosterViewController {
            destination.poster = movie?.posterPath ?? ""
        }
    }
    
    
    
}
