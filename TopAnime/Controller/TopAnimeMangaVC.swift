//
//  AnimeTableViewController.swift
//  TopAnime
//
//  Created by Anton on 9/21/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit
import Kingfisher

class TopTableViewController: UITableViewController {
  
  var animeMangaList = [TopAnimeManga]()
  var topRequest = TopManager()
  
  var genreList = [Anime]()
  var genreRequest = GenreManager()
  
  var topGenreType = String()
  var topGenrePage = "1"
  var topSubType = String()
  
  var topGenreId = K.topID
  
  var animeMangaGenreId = String()
  var animeMangaTitle = String()
  
   
  @IBOutlet var animeTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animeTableView.register(UINib(nibName: K.cellIdentifier, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    topRequest.delegate = self
    genreRequest.delegate = self
    
    if topGenreId == K.topID {
      topRequest.fetchTop(topGenreType, topGenrePage, topSubType)
    } else {
      genreRequest.performRequest(genreType: topGenreType, genreId: animeMangaGenreId, genrePage: topGenrePage)
    }
  }
  

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if topGenreId == K.topID {
      return animeMangaList.count
    } else {
      return genreList.count
    }
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = animeTableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! AnimeCell
    
    if topGenreId == K.topID {
      let anime = animeMangaList[indexPath.row]
      cell.setupAnimeCell(anime)
    } else {
      let genre = genreList[indexPath.row]
      cell.setupGenre(genre)
    }
    
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     performSegue(withIdentifier: K.SegueIdentifiers.toDetails, sender: self)
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let destination = segue.destination as? DetailsViewController {
       let index = tableView.indexPathForSelectedRow?.row
       
      destination.parentAnime = animeMangaList[index!]
       
       if animeMangaTitle == K.VCTitle.animeVC {
         destination.id = K.animeID
         destination.title = "Anime"
       } else {
         destination.id = K.mangaID
         destination.title = "Manga"
       }
     }
   }
  
}


extension TopTableViewController: TopManagerDelegate {
  func didFetchTopAnimeManga(_ topManager: TopManager, _ top: TopModel) {
    for item in top.top {
      self.animeMangaList.append(item)
    }
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
  func didFailWithError(_ error: Error) {
    print(error)
  }
}

extension TopTableViewController: GenreManagerDelegate {
  func didFetchGenreData(_ genreData: GenreModel) {
    for item in genreData.genreAnime {
        genreList.append(item)
    }
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}
