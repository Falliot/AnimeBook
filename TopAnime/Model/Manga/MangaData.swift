//
//  MangaData.swift
//  TopAnime
//
//  Created by Anton on 10/2/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation

struct MangaData: Decodable {
  let webPage: String
  let imageURL: String
  let name: String
  let englishName: String?
  let japanName: String
  let otherNames: [String]
  let status: String
  let type: String
  let volumes: Int?
  let chapters: Int?
  let published: Aired
  let rank: Int
  let score: Double
  let popularity: Int
  let details: String
  let genres: [Genre]?
  let authors: [Authors]?
  
  enum CodingKeys: String, CodingKey {
    case webPage = "url"
    case imageURL = "image_url"
    case name = "title"
    case englishName = "title_english"
    case japanName = "title_japanese"
    case otherNames = "title_synonyms"
    case status
    case type
    case volumes
    case chapters
    case published
    case rank
    case score
    case popularity
    case details = "synopsis"
    case genres
    case authors
  }
}
struct Authors: Decodable {
  let name: String
}
