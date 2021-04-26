//
//  MovieModel.swift
//  API MVVM
//
//  Created by Admin on 4/26/21.
//

import Foundation

struct MovieModel: Codable {
    var artistName: String?
    var trackName: String?
}

struct ResultModel: Codable {
    
    var results = [MovieModel]()
    
    init(results: [MovieModel]) {
        self.results = results
    }
}

