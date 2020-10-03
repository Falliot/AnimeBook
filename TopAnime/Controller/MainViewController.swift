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
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  @IBAction func topRatedBtnPressed(_ sender: Any) {
    if self.title == K.VCTitle.animeVC {
      performSegue(withIdentifier: K.SegueIdentifiers.fromAnime, sender: self)
    } else {
      performSegue(withIdentifier: K.SegueIdentifiers.fromManga, sender: self)
    }
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destinationVC = segue.destination as? TopTableViewController {
      if segue.identifier == K.SegueIdentifiers.fromAnime {
        destinationVC.topType = "anime"
        destinationVC.topSubType = ""
        destinationVC.animeMangaTitle = K.VCTitle.animeVC
      } else {
        destinationVC.topType = "manga"
        destinationVC.topSubType = ""
        destinationVC.animeMangaTitle = K.VCTitle.mangaVC
      }
    }
  }
  

}
