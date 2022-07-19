//
//  MovieDetails.swift
//  challenge-triunfo
//
//  Created by Guilherme Souza on 19/07/22.
//

import Foundation

struct MovieDetails: Codable {
    
    var runtime: Int
    let genres: [Genres]
    
}

struct Genres: Codable {
    
    let id: Int
    let name: String
    
}
