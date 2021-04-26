//
//  Service.swift
//  API MVVM
//
//  Created by Admin on 4/27/21.
//

import Foundation

class Service {
    
    static let shareInstance = Service()
    
    func getAllMovieData(completion: @escaping([MovieModel]?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?media=music&term=bollywood"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completion(nil, err)
                print("Loading data error: \(err.localizedDescription)")
            } else {
                guard let data = data else { return }
                do {
                    var arrMovieData = [MovieModel]()
                    let results = try JSONDecoder().decode(ResultModel.self, from: data)
                    for movie in results.results {
                        arrMovieData.append(MovieModel(artistName: movie.artistName, trackName: movie.trackName))
                        print(arrMovieData)
                    }
                } catch let jsonError {
                    print("Json error: \(jsonError.localizedDescription)")
                }
            }
        }.resume()
    }
}
