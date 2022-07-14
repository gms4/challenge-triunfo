//
//  UpcomingCollectionViewCell.swift
//  challenge-triunfo
//
//  Created by Guilherme Souza on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    @IBOutlet var upcomingImage: UIImageView!
    @IBOutlet var upcomingTitle: UILabel!
    @IBOutlet var upcomingDate: UILabel!
    
    func setup (title: String, year: String, image: UIImage) {
        
        upcomingTitle.text = title
        self.upcomingImage.image = image
        upcomingDate.text = year
        
    }
    
}
