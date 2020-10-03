//
//  MainViewController.swift
//  TopAnime
//
//  Created by Anton on 10/1/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  @IBOutlet weak var topRatedBtn: UIButton!
  @IBOutlet weak var topPopularityBtn: UIButton!
  @IBOutlet weak var genres: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  
  @IBAction func topRatedBtnPressed(_ sender: Any) {
    if self.title == K.VCTitle.animeVC {
      performSegue(withIdentifier: K.SegueIdentifiers.fromAnimeToRated, sender: self)
    } else {
      performSegue(withIdentifier: K.SegueIdentifiers.fromMangaToRated, sender: self)
    }
  }
  
  @IBAction func topPopularityBtnPressed(_ sender: Any) {
    if self.title == K.VCTitle.animeVC {
      performSegue(withIdentifier: K.SegueIdentifiers.fromAnimeToPopular, sender: self)
    } else {
      performSegue(withIdentifier: K.SegueIdentifiers.fromMangaToPopular, sender: self)
    }
  }
  
  @IBAction func genresBtnPressed(_ sender: Any) {
    if self.title == K.VCTitle.animeVC {
      performSegue(withIdentifier: K.SegueIdentifiers.fromAnimeToGenres, sender: self)
    } else {
      performSegue(withIdentifier: K.SegueIdentifiers.fromMangaToGenres, sender: self)
    }
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destinationVC = segue.destination as? TopTableViewController {
      switch segue.identifier {
      case K.SegueIdentifiers.fromAnimeToRated:
        destinationVC.topGenreType = "anime"
        destinationVC.topSubType = ""
        destinationVC.animeMangaTitle = K.VCTitle.animeVC
      case K.SegueIdentifiers.fromMangaToRated:
        destinationVC.topGenreType = "manga"
        destinationVC.topSubType = ""
        destinationVC.animeMangaTitle = K.VCTitle.mangaVC
      case K.SegueIdentifiers.fromAnimeToPopular:
        destinationVC.topGenreType = "anime"
        destinationVC.topSubType = "bypopularity"
        destinationVC.animeMangaTitle = K.VCTitle.animeVC
      case K.SegueIdentifiers.fromMangaToPopular:
        destinationVC.topGenreType = "manga"
        destinationVC.topSubType = "bypopularity"
        destinationVC.animeMangaTitle = K.VCTitle.mangaVC
      default:
        print("Default")
      }
    } else if let destinationVC = segue.destination as? GenresTableViewController {
      if segue.identifier == K.SegueIdentifiers.fromAnimeToGenres {
        destinationVC.animeMangaID = K.animeID
      } else {
        destinationVC.animeMangaID = K.mangaID
      }   
    }
  }
}
