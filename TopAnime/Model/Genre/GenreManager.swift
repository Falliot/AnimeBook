//
//  GenreManager.swift
//  TopAnime
//
//  Created by Anton on 10/3/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation


import Foundation

protocol GenreManagerDelegate {
  func didFetchGenreData(_ genreData: GenreModel)
  func didFailWithError(_ error: Error)
}

struct GenreManager {
  
  var delegate: GenreManagerDelegate?
  
  func performRequest(genreType: String, genreId: String, genrePage: String) {
    
    let urlString = K.genreURL + "\(genreType)/" + "\(genreId)/" + "\(genrePage)"
    print(urlString)
    let url = URL(string: urlString)!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      if error != nil {
        self.delegate?.didFailWithError(error!)
        return
      }

      if let safeData = data {
        if let genre = self.decodeJSON(genreData: safeData) {
          print(genre)
          self.delegate?.didFetchGenreData(genre)
        }
      }
    }
    task.resume()
  }
  
  private func decodeJSON(genreData: Data) -> GenreModel? {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    do {
      let decodedData = try decoder.decode(GenreData.self, from: genreData)
      let genre = GenreModel(genreAnime: decodedData.anime)
      return genre
    } catch {
      delegate?.didFailWithError(error)
      return nil
    }
  }
}
