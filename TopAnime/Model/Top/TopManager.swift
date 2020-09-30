//
//  TopManager.swift
//  TopAnime
//
//  Created by Anton on 9/30/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation

protocol TopManagerDelegate {
  func didFetchTopAnimeManga(_ topManager: TopManager, _ top: TopModel)
  func didFailWithError(_ error: Error)
}



struct TopManager {
    
  var delegate: TopManagerDelegate?
  
  func fetchTop(topType: String) {
    let urlString = K.animeMangaTopURL + "\(topType)"
    print(urlString)
    performRequest(urlString)
  }
  
  func performRequest(_ urlString: String) {
    
    let url = URL(string: urlString)!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      if error != nil {
        self.delegate?.didFailWithError(error!)
        return
      }
      
      if let safeData = data {
        if let top = self.parseJSON(safeData) {
          self.delegate?.didFetchTopAnimeManga(self, top)
        }
      }
    }
    task.resume()
  }
  
  
  func parseJSON(_ topData: Data) -> TopModel? {
    let decoder = JSONDecoder()
    do {
      let decodedData = try decoder.decode(TopData.self, from: topData)
      print(decodedData)
      return TopModel(top: decodedData.top)
    } catch {
      delegate?.didFailWithError(error)
      return nil
    }
  }
}
