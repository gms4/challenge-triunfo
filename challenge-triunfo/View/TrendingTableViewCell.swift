//
//  TrendingTableViewCell.swift
//  challenge-triunfo
//
//  Created by Guilherme Souza on 19/07/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var yearLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup (title: String, year: String, image: UIImage) {
        
        titleLabel.text = title
        self.posterImage.image = image
        yearLabel.text = String(year.prefix(4))
        self.posterImage.layer.cornerRadius = 12
        
    }

}
