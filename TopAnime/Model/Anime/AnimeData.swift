//
//  AnimeData.swift
//  TopAnime
//
//  Created by Anton on 9/30/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation

struct AnimeData: Decodable {
  
  let webPage: String
  let imageURL: String
  let trailer: String
  let name: String
  let japanName: String
  let otherNames: [String]?
  let type: String
  let episodes: Int?
  let status: String
  let score: Double
  let popularity: Int
  let details: String
  let premiered: String
  
  let genre: [Genre]
  
  
  enum CodingKeys: String, CodingKey {
    case webPage = "url"
    case imageURL = "image_url"
    case trailer = "trailer_url"
    case name = "title"
    case japanName = "title_japanese"
    case otherNames = "title_synonyms"
    case type
    case episodes
    case status
    case score
    case popularity
    case details = "synopsis"
    case premiered
    
    case genre = "genres"
  }
  
//  init(from decoder: Decoder) throws {
//  let container = try decoder.container(keyedBy: CodingKeys.self)
//  webPage = try container.decode(String.self, forKey: .webPage)
//  imageURL = try  container.decode(String.self, forKey: .imageURL)
//  trailer = try container.decode(String.self, forKey: .trailer)
//  name = try container.decode(String.self, forKey: .name)
//  japanName = try container.decode(String.self, forKey: .japanName)
//  otherNames = try container.decode([String].self, forKey: .otherNames)
//  type = try container.decode(String.self, forKey: .type)
//  episodes = try container.decode(Int.self, forKey: .episodes)
//  status = try container.decode(String.self, forKey: .status)
//  score = try container.decode(Double.self, forKey: .score)
//  popularity = try container.decode(Int.self, forKey: .popularity)
//  details = try container.decode(String.self, forKey: .details)
//  premiered = try container.decode(String.self, forKey: .premiered)
//  genre = try container.decode([Genre].self, forKey: .genre)
//
//  }
//  
//  
}

struct Genre : Decodable {
  let name: String
}

