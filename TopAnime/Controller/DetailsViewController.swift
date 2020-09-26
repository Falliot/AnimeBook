//
//  DetailsViewController.swift
//  TopAnime
//
//  Created by Anton on 9/24/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

  @IBOutlet weak var imgView: UIImageView!
  
  @IBOutlet weak var titleLbl: UILabel!
  @IBOutlet weak var typeLbl: UILabel!
  @IBOutlet weak var episodesLbl: UILabel!
  @IBOutlet weak var premieredLbl: UILabel!
  @IBOutlet weak var genreLbl: UILabel!
  @IBOutlet weak var scoreLbl: UILabel!
  @IBOutlet weak var rankLbl: UILabel!
  
  @IBOutlet weak var backgroundImg: UIImageView!
  
  var anime: Top?
  
  var url : URL? {
    return URL(string: anime!.imageURL)
  }

  override func viewDidLoad() {
        super.viewDidLoad()
    title = anime?.title
    imgView.kf.setImage(with: url)
    backgroundImg.kf.setImage(with: url)
    setupLabels()
      
    }
  
  func setupLabels() {
    titleLbl.text = anime?.title
//    typeLbl.text = anime.
    premieredLbl.text = anime?.startDate
    episodesLbl.text = String(describing: (anime?.episodes)!)
    scoreLbl.text = String(describing: (anime?.score)!)
    rankLbl.text = String(describing: (anime?.rank)!)
  }
}
