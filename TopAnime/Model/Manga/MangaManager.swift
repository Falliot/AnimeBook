//
//  MangaManager.swift
//  TopAnime
//
//  Created by Anton on 10/2/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation

protocol MangaManagerDelegate {
  func didFetchMangaData(_ mangaModel: MangaModel)
  func didFailWithError(_ error: Error)
}

struct MangaManager {
  
  var delegate: MangaManagerDelegate?
  
  func performRequest(mangaID: String, mangaRequest: String, completion: @escaping (Result<MangaModel, Error>) -> ()) {
    
    let urlString = K.mangaURL + "\(mangaID)/" + "\(mangaRequest)"
    print(urlString)
    guard let url = URL(string: urlString) else {
      print("MangaURL doesn't exists")
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      if error != nil {
        completion(.failure(error!))
        return
      }
      if let safeData = data {
        if let manga = self.decodeJSON(safeData) {
          print(manga)
          completion(.success(manga))
        }
      }
    }
    task.resume()
  }
  
  
  func decodeJSON(_ data: Data) -> MangaModel? {
    let decoder = JSONDecoder()
    do {
      let decodedData = try decoder.decode(MangaData.self, from: data)
      let manga = setupManga(mangaData: decodedData)
      return manga
    } catch let err {
      self.delegate?.didFailWithError(err)
      return nil
    }
  }
  
  private func setupManga(mangaData: MangaData) -> MangaModel {
    
    let webPage = mangaData.webPage
    let imageURL = mangaData.imageURL
    let title = mangaData.name
    let japanTitle = mangaData.japanName
    let type = mangaData.type
    let status = mangaData.status
    let details = mangaData.details
    let published = mangaData.published.string
    
    var otherNames = [String]()
    var authors = [String]()
    var genres = [String]()
    var volumes = String()
    var chapters = String()
    var englishTitle = String()
    
    
    if mangaData.englishName != nil {
      englishTitle = mangaData.englishName!
    } else {
      englishTitle = " - "
    }
  
    if mangaData.volumes != nil {
      volumes = "\(mangaData.volumes!)"
    } else {
      volumes = " - "
    }
    
    if mangaData.chapters != nil {
      chapters = "\(mangaData.chapters!)"
    } else {
      chapters = " - "
    }
    
    var score = String()
    
  
    if mangaData.score != nil {
      score = String(format: "%.2f", mangaData.score!)
    } else {
      score = " - "
    }
    
    var popularity : String {
      return String(mangaData.popularity)
    }
    
    let rank = "\(mangaData.rank)"
    
    if mangaData.otherNames.count != 0 {
      otherNames = mangaData.otherNames
    } else {
      otherNames.append("No other names")
    }
    
    if mangaData.authors != nil {
      for author in mangaData.authors! {
        authors.append(author.name)
      }
    } else {
      authors.append(" - ")
    }
    
    
    if mangaData.genres != nil {
      for genre in mangaData.genres! {
        genres.append(genre.name)
      }
    } else {
      genres.append("Unknown")
    }
    
    let manga = MangaModel(mangaPage: webPage, mangaImage: imageURL, mangaName: title, mangaEnglishName: englishTitle, mangaJapanName: japanTitle, mangaOtherNames: otherNames, mangaStatus: status, mangaType: type, mangaVolumes: volumes, mangaChapters: chapters, mangaPublished: published, mangaRank: rank, mangaScore: score, mangaPopularity: popularity, mangaDetails: details, mangaGenre: genres, mangaAuthors: authors)
    
    return manga
  }
}


