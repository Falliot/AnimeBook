//
//  Constants.swift
//  TopAnime
//
//  Created by Anton on 9/26/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import Foundation

struct K {
  
  static let cellIdentifier = "AnimeCell"
  static let animeMangaTopURL = "https://api.jikan.moe/v3/top/"
  static let animeURL = "https://api.jikan.moe/v3/anime/"
  static let mangaURL = "https://api.jikan.moe/v3/manga/"
  static let animeID = "anime"
  static let mangaID = "manga"
  
  struct SegueIdentifiers {
    static let toDetails = "toDetails"
    static let fromAnime = "fromAnime"
    static let fromManga = "fromManga"
  }
  
  struct VCTitle {
    static let animeVC = "AnimeVC"
    static let mangaVC = "MangaVC"
  }
  
}
