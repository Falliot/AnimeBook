//
//  AnimeManager.swift
//  TopAnime
//
//  Created by Anton on 9/30/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation

protocol AnimeManagerDelegate {
  func didFetchAnimeData(_ animeManager: AnimeManager, _ animeData: AnimeModel)
  func didFailWithError(_ error: Error)
}

struct AnimeManager {
  
  var delegate: AnimeManagerDelegate?
  
  func fetchAnime(animeID: String) {
    let urlString = K.animeURL + animeID
    print(urlString)
    performRequest(urlString)
  }
  
 private func performRequest(_ urlString: String) {
    
    let url = URL(string: urlString)!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      if error != nil {
        self.delegate?.didFailWithError(error!)
        return
      }
      
      if let safeData = data {
        if let anime = self.decodeJSON(animeData: safeData) {
          self.delegate?.didFetchAnimeData(self, anime)
        }
      }
    }
    task.resume()
  }
  
  private func decodeJSON(animeData: Data) -> AnimeModel? {
    let decoder = JSONDecoder()
    do {
      let decodedData = try decoder.decode(AnimeData.self, from: animeData)
      print(decodedData)
      let anime = setupAnime(animeData: decodedData)
      return anime
    } catch {
      delegate?.didFailWithError(error)
      return nil
    }
  }
  
  private func setupAnime(animeData: AnimeData) -> AnimeModel {
    
    let webPage = animeData.webPage
    let imageURL = animeData.imageURL
    let trailer = animeData.trailer
    let title = animeData.name
    let japanTitle = animeData.japanName
    let type = animeData.type
    let status = animeData.status
    let details = animeData.details
    let premiere = animeData.premiered
    let genres = animeData.genre
    var episodes: String
    var otherNames = [String]()
    
    
    var score: String {
      return String(format: "%.2f", animeData.score)
    }
    
    var popularity : String {
      return String(animeData.popularity)
    }
    
    if animeData.episodes != nil {
      episodes = "\(String(describing: animeData.episodes))"
    } else {
      episodes = "Still airing"
    }
    
    if animeData.otherNames != nil {
      otherNames = animeData.otherNames!
    } else {
      otherNames.append("No other names")
    }
    
    let anime = AnimeModel(animePage: webPage, animeImage: imageURL, animeTrailer: trailer, animeName: title, animeJapanName: japanTitle, animeOtherNames: otherNames, animeType: type, animeEpisodes: episodes, animeStatus: status, animeScore: score, animePopularity: popularity, animeDetails: details, animePremire: premiere, animeGenre: genres)
    return anime
  }
}
