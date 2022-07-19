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
    
    let monthToNameDic = ["01-": "Jan ",
                          "02-": "Feb ",
                          "03-": "Mar ",
                          "04-": "Apr ",
                          "05-": "May ",
                          "06-": "Jun ",
                          "07-": "Jul ",
                          "08-": "Aug ",
                          "09-": "Sep ",
                          "10-": "Oct ",
                          "11-": "Nov ",
                          "12-": "Dec "]
    
    func setup (title: String, year: String, image: UIImage) {
        
        upcomingTitle.text = title
        self.upcomingImage.image = image
        upcomingDate.text = convertDate(data: String(year.suffix(5)))
        self.upcomingImage.layer.cornerRadius = 16
        
    }
    
    func convertDate (data: String) -> String {
        
        return (monthToNameDic[String(data.prefix(3))] ?? "") + String (data.suffix(2))
        
    }
    
}
