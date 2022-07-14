//
//  NowPlayingCollectionViewCell.swift
//  challenge-triunfo
//
//  Created by Guilherme Souza on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup (title: String, year: String, image: UIImage) {
        
        titleLabel.text = title
        self.imageView.image = image
        dateLabel.text = year
        
    }
    
}
