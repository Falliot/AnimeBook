//
//  URLRequest.swift
//  TopAnime
//
//  Created by Anton on 9/21/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation

struct Request {
  
  func fetchData(completion: @escaping (Result<[Top], Error>) -> ()) {
    
    let stringURL = "https://api.jikan.moe/v3/top/anime/"
    
    let url = URL(string: stringURL)
    
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
      
      if let err = error {
        completion(.failure(err))
        return
      }
      
      if let jsonData = data {
        do {
          let decoder = JSONDecoder()
          let parsedJSON = try decoder.decode(AnimeData.self, from: jsonData)
          for animes in parsedJSON.top {
            completion(.success([animes]))
          }
          
        } catch let err {
          completion(.failure(err))
        }
      }
    }.resume()
  }
}


