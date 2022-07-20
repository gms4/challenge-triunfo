//
//  FeaturedViewController.swift
//  challenge-triunfo
//
//  Created by Guilherme Souza on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
//    let nowPlayingMovies = Movie.nowPlayingMovies()
//    let upcomingMovies = Movie.upcomingMovies()
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        
        upcomingCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
        overrideUserInterfaceStyle = .dark
        sleep(2)
        
        Task {
            
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
            
            self.nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
            
            self.upcomingMovies = await Movie.upcomingMoviesAPI()
            self.upcomingCollectionView.reloadData()
            
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
                   if let destination = segue.destination as? DetailsViewController{
                       let movie = sender as? Movie
                       destination.movie = movie
                   }
               }
               else if segue.identifier == "seeAllPopular" {
                   if let destination = segue.destination as? SeeAllViewController{
                       destination.seeAllMovies = popularMovies
                   }
               }
               else if segue.identifier == "seeAllNowPlaying" {
                   if let destination = segue.destination as? SeeAllViewController{
                       destination.seeAllMovies = nowPlayingMovies
                   }
               }
               else if segue.identifier == "seeAllUpcoming" {
                   if let destination = segue.destination as? SeeAllViewController{
                       destination.seeAllMovies = upcomingMovies
                   }
               }
           }
    }

