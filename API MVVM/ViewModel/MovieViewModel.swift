//
//  MovieViewModel.swift
//  API MVVM
//
//  Created by Admin on 4/27/21.
//

import UIKit

class MovieViewModel: NSObject {

    var artistName: String?
    var trackName: String?
    
    // Dependency Injection
    init(movie: MovieModel) {
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
}
