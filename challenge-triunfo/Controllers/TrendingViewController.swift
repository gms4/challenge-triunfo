//
//  TrendingViewController.swift
//  challenge-triunfo
//
//  Created by Guilherme Souza on 19/07/22.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            trendingMovies = trendingTodayMovies
            trendingTableView.reloadData()
        } else {
            trendingMovies = trendingThisWeekMovies
            trendingTableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
    @IBOutlet var trendingTableView: UITableView!
    var trendingTodayMovies: [Movie] = []
    var trendingThisWeekMovies: [Movie] = []
    var trendingMovies: [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.trendingTableView.dataSource = self
        self.trendingTableView.delegate = self
        
        Task {
            
            trendingTodayMovies = await Movie.trendingTodayMoviesAPI()
            trendingThisWeekMovies = await Movie.trendingThisWeekMoviesAPI()
            trendingMovies = trendingTodayMovies
            
            trendingTableView.reloadData()
            
        }
        
    }

}

extension TrendingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "trendingTableViewCell", for: indexPath) as? TrendingTableViewCell {
            
            let movie = trendingMovies[indexPath.item]
        
            cell.setup(title: movie.title, year: movie.releaseDate, image: UIImage())
            
            Task {
                
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let image = UIImage(data: imageData)
                cell.setup(title: movie.title, year: movie.releaseDate, image: image ?? UIImage())
                
            }
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    
}

extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = trendingMovies[indexPath.item]
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    
}
