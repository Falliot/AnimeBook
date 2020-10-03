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
      
      guard let safeData = data else {
        self.delegate?.didFailWithError(error!)
        return
      }
      
      
      if genreType == K.animeID {
        guard let genreAnime = self.decodeAnimeJSON(genreAnimeData: safeData) else {
          self.delegate?.didFailWithError(error!)
          return
        }
        self.delegate?.didFetchGenreData(genreAnime)
      } else {
        guard let genreManga = self.decodeMangaJSON(genreMangaData: safeData) else {
          self.delegate?.didFailWithError(error!)
          return
        }
        self.delegate?.didFetchGenreData(genreManga)
      }
    }
    task.resume()
  }
  
  private func decodeAnimeJSON(genreAnimeData: Data) -> GenreModel? {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    do {
      let decodedData = try decoder.decode(GenreData.self, from: genreAnimeData)
      let genre = GenreModel(genreAnime: decodedData.anime!)
      return genre
    } catch {
      delegate?.didFailWithError(error)
      return nil
    }
  }
  
  private func decodeMangaJSON(genreMangaData: Data) -> GenreModel? {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    do {
      let decodedData = try decoder.decode(GenreData.self, from: genreMangaData)
      let genre = GenreModel(genreAnime: decodedData.manga!)
      return genre
    } catch {
      delegate?.didFailWithError(error)
      return nil
    }
  }
}
