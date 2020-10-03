//
//  GenreData.swift
//  TopAnime
//
//  Created by Anton on 10/3/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation

struct GenreData: Decodable {
  let anime: [Anime]
}

struct Anime: Decodable {
  let name: String
  let imageURL: String
  
  enum CodingKeys: String, CodingKey {
    case name = "title"
    case imageURL = "image_url"
  }
}
