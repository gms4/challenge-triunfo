//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  challenge-triunfo
//
//  Created by Guilherme Souza on 12/07/22.
//

import UIKit
extension FeaturedViewController: UICollectionViewDataSource {
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell {
            cell.titleLabel.text = popularMovies[indexPath.item].title
            cell.image.image = UIImage(named: popularMovies[indexPath.item].backdrop)
            return cell
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell {
            
            cell.titleLabel.text = nowPlayingMovies[indexPath.item].title
            cell.dateLabel.text = String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))
            cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
            
            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell {
            cell.upcomingTitle.text = upcomingMovies[indexPath.item].title
            cell.upcomingDate.text = String(upcomingMovies[indexPath.item].releaseDate.prefix(4))
            cell.upcomingImage.image = UIImage(named: upcomingMovies[indexPath.item].poster)
            return cell
        }
        return UpcomingCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else {
            return upcomingMovies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else {
            return makeUpcomingCell(indexPath)
        }
        
    }
    
}


