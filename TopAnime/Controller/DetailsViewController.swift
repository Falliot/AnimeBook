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
  
  var anime: AnimeModel?
  var animeManager = AnimeManager()
  
  var url : URL? {
    return URL(string: anime!.animeImage)
  }

  override func viewDidLoad() {
        super.viewDidLoad()
    title = anime?.animeName
//    imgView.kf.setImage(with: url)
    
//    setupLabels()
//    setupBackground()

  }
  
//  func setupLabels() {
//    titleLbl.text = anime?.title
//    typeLbl.text = anime.
//    premieredLbl.text = anime?.startDate
//    episodesLbl.text = String(describing: (anime?.episodes)!)
//    scoreLbl.text = String(describing: (anime?.score)!)
//    rankLbl.text = String(describing: (anime?.rank)!)
//  }
//
//  func setupBackground() {
//    let backgroundImg = UIImageView(frame: UIScreen.main.bounds)
//    backgroundImg.kf.setImage(with: url)
//    backgroundImg.contentMode = .scaleAspectFill
//    view.insertSubview(backgroundImg, at: 0)
//
//    let blurEffect = UIBlurEffect(style: .dark)
//    let blurEffectView = UIVisualEffectView(effect: blurEffect)
//    blurEffectView.frame = backgroundImg.frame
//    view.insertSubview(blurEffectView, at: 1)
//  }
//
}
extension DetailsViewController: AnimeManagerDelegate {
  func didFetchAnimeData(_ animeManager: AnimeManager, _ animeData: AnimeModel) {
    anime = animeData
  }
  
  func didFailWithError(_ error: Error) {
    print("AnimeManagerError: \(error)")
  }
  
  
}
