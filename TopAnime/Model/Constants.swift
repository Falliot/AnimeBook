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
  static let genreURL = "https://api.jikan.moe/v3/genre/"
  static let animeID = "anime"
  static let mangaID = "manga"
  static let genreID = "genre"
  static let topID = "top"
  
  struct SegueIdentifiers {
    static let toDetails = "toDetails"
    static let fromAnimeToRated = "fromAnimeToRated"
    static let fromMangaToRated = "fromMangaToRated"
    static let fromAnimeToPopular = "fromAnimeToPopular"
    static let fromMangaToPopular = "fromMangaToPopular"
    static let fromAnimeToGenres = "fromAnimeToGenres"
    static let fromMangaToGenres = "fromMangaToGenres"
    static let fromGenreToAnimeManga = "fromGenreToAnimeManga"
  }
  
  struct VCTitle {
    static let animeVC = "AnimeVC"
    static let mangaVC = "MangaVC"
  }
  
}
