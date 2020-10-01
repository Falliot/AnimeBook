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
      
      if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers),
         let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
          print(String(decoding: jsonData, as: UTF8.self))
      } else {
          print("json data malformed")
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
    decoder.dateDecodingStrategy = .iso8601
    do {
      let decodedData = try decoder.decode(AnimeData.self, from: animeData)
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
    let title = animeData.name
    let japanTitle = animeData.japanName
    let type = animeData.type
    let status = animeData.status
    let details = animeData.details
    var premiered: String
    var trailer: String
    var episodes: String
    var otherNames = [String]()
    var genres = [String]()
    var studios = [String]()
    
    let aired = animeData.aired.string
    
    if animeData.premiered != nil {
      premiered = animeData.premiered!
    } else {
      premiered = "No Info"
    }
    
    
    if animeData.trailer != nil {
      trailer = animeData.trailer!
    } else {
      trailer = "No Trailer"
    }
    
    var score: String {
      return String(format: "%.2f", animeData.score)
    }
    
    var popularity : String {
      return String(animeData.popularity)
    }
    
    let rank = "\(animeData.rank)"
    
    if animeData.episodes != nil {
      episodes = "\(animeData.episodes!)"
    } else {
      episodes = "Still airing"
    }
    
    if animeData.otherNames?.count != 0 {
      otherNames = animeData.otherNames!
    } else {
      otherNames.append("No other names")
    }
    
    
    if animeData.genre != nil {
      for genre in animeData.genre! {
        genres.append(genre.name)
      }
    } else {
      genres.append("Unknown")
    }
    
    if animeData.studio != nil {
      for studio in animeData.studio! {
        studios.append(studio.name)
      }
    } else {
      studios.append("Unknown")
    }
    
    
    let anime = AnimeModel(animePage: webPage, animeImage: imageURL, animeTrailer: trailer, animeName: title, animeJapanName: japanTitle, animeOtherNames: otherNames, animeType: type, animeEpisodes: episodes, animeStatus: status, animeScore: score, animePopularity: popularity, animeDetails: details, animePremire: premiered, animeGenre: genres, animeStudio: studios, animeRank: rank, animeAired: aired)
    return anime
  }
}
