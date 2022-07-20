//
//  SeeAllTableViewCell.swift
//  Ticket to Watch
//
//  Created by Guilherme Souza on 19/07/22.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {

    static let cellIdentifier = "tableCell"
    
    @IBOutlet var imagePoste: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    
    func setup (title: String, rating: String, image: UIImage, year: String) {
            
            titleLabel.text = title
            imagePoste.image = image
            yearLabel.text = year
            ratingLabel.text = "\(rating)/10"
            self.imagePoste.layer.cornerRadius = 8
            
        }
    
}
