//
//  AnimeData.swift
//  TopAnime
//
//  Created by Anton on 9/21/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation


struct AnimeData: Decodable {
  let top: [Top]
}


struct Top: Decodable {

  let rank: Int
  let title: String
  let url: String
  let imageURL: String
  let episodes: Int
  let score: Double
  let startDate: String
  
  
  enum CodingKeys: String, CodingKey {
    case rank
    case title
    case url
    case imageURL = "image_url"
    case episodes
    case score
    case startDate = "start_date"
  }
  
  init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    rank = try container.decode(Int.self, forKey: .rank)
    title = try container.decode(String.self, forKey: .title)
    url = try container.decode(String.self, forKey: .url)
    imageURL = try container.decode(String.self, forKey: .imageURL)
    episodes = try container.decode(Int.self, forKey: .episodes)
    score = try container.decode(Double.self, forKey: .score)
    startDate = try container.decode(String.self, forKey: .startDate)
  }
  
}
//"mal_id": 5114,
//"rank": 1,
//"title": "Fullmetal Alchemist: Brotherhood",
//"url": "https://myanimelist.net/anime/5114/Fullmetal_Alchemist__Brotherhood",
//"image_url": "https://cdn.myanimelist.net/images/anime/1223/96541.jpg?s=faffcb677a5eacd17bf761edd78bfb3f",
//"type": "TV",
//"episodes": 64,
//"start_date": "Apr 2009",
//"end_date": "Jul 2010",
//"members": 1951120,
//"score": 9.22
