//
//  PosterViewController.swift
//  challenge-triunfo
//
//  Created by Guilherme Souza on 19/07/22.
//

import UIKit

class PosterViewController: UIViewController {

    @IBOutlet var imagePoster: UIImageView!
    var poster: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        
        Task {
            
            let imageData = await Movie.downloadImageData(withPath: poster)
            let image = UIImage(data: imageData)
            imagePoster.image = image
            
        }
        
    }
    
}
