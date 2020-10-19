//
//  TopData.swift
//  TopAnime
//
//  Created by Anton on 9/30/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation

struct TopData: Decodable {
  let top: [TopAnimeManga]
}

struct TopAnimeManga: Decodable {
  
  let id: Int
  let rank: Int
  let type: String
  let title: String
  let url: String
  let imageURL: String
  let episodes: Int?
  let score: Double
  let startDate: String
  
  
  enum CodingKeys: String, CodingKey {
    case id = "mal_id"
    case rank
    case type
    case title
    case url
    case imageURL = "image_url"
    case episodes
    case score
    case startDate = "start_date"
  }
  
}
