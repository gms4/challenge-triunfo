//
//  FeaturedViewController.swift
//  challenge-triunfo
//
//  Created by Guilherme Souza on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    
    
    let movieQualquer = Movie(title: "Harry Potter", poster: "poster_hp.jpg", backdrop: "backdrop_hp.jpg", voteAverage: 4.5, releaseDate: "2001", overview: "Um bruxinho vai pra escola de magia e vive altas aventuras", genres: ["Fantasia", "Ação", "Mistério e Aventura"])
    let movies = [Movie(title: "Harry Potter", poster: "poster_hp.jpg", backdrop: "backdrop_hp.jpg", voteAverage: 4.5, releaseDate: "2001", overview: "Um bruxinho vai pra escola de magia e vive altas aventuras", genres: ["Fantasia", "Ação", "Mistério e Aventura"]), Movie(title: "Harry Potter", poster: "poster_hp.jpg", backdrop: "backdrop_hp.jpg", voteAverage: 4.5, releaseDate: "2001", overview: "Um bruxinho vai pra escola de magia e vive altas aventuras", genres: ["Fantasia", "Ação", "Mistério e Aventura"]), Movie(title: "Harry Potter", poster: "poster_hp.jpg", backdrop: "backdrop_hp.jpg", voteAverage: 4.5, releaseDate: "2001", overview: "Um bruxinho vai pra escola de magia e vive altas aventuras", genres: ["Fantasia", "Ação", "Mistério e Aventura"]), Movie(title: "Harry Potter", poster: "poster_hp.jpg", backdrop: "backdrop_hp.jpg", voteAverage: 4.5, releaseDate: "2001", overview: "Um bruxinho vai pra escola de magia e vive altas aventuras", genres: ["Fantasia", "Ação", "Mistério e Aventura"])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        popularCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell {
            cell.titleLabel.text = "Título do Filme"
            cell.image.image = UIImage()
            return cell
        }
        
        return UICollectionViewCell()
    
    }

}
