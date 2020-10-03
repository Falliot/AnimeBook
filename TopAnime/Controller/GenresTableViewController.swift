//
//  GenresTableViewController.swift
//  TopAnime
//
//  Created by Anton on 10/3/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit

class GenresTableViewController: UITableViewController {

  
  var animeMangaID = String()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      print(animeMangaID)
  }

  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if animeMangaID == K.animeID {
      return Genres.animeGenres.count
    } else {
      return Genres.mangaGenres.count
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
    if animeMangaID == K.animeID {
      cell.textLabel?.text = Genres.animeGenres[indexPath.row].description
    } else {
      cell.textLabel?.text = Genres.mangaGenres[indexPath.row].description
    }
      
    return cell
  }

}
