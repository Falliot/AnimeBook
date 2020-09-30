//
//  DetailsViewController.swift
//  TopAnime
//
//  Created by Anton on 9/24/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController, ActivityIndicatorPresenter {
  
  //For working ActivityIndicator
  var greyView = UIView()
  var activityIndicator = UIActivityIndicatorView()
  
  @IBOutlet weak var imgView: UIImageView!
  
  @IBOutlet weak var titleLbl: UILabel!
  @IBOutlet weak var typeLbl: UILabel!
  @IBOutlet weak var episodesLbl: UILabel!
  @IBOutlet weak var premieredLbl: UILabel!
  @IBOutlet weak var genreLbl: UILabel!
  @IBOutlet weak var scoreLbl: UILabel!
  @IBOutlet weak var rankLbl: UILabel!
  
  var parentAnime: TopAnimeManga?
  var anime: AnimeModel?
  var animeManager = AnimeManager()
  
  var url : URL? {
    return URL(string: parentAnime!.imageURL)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    showActivityIndicator()
    animeManager.delegate = self
    animeManager.fetchAnime(animeID: "\(parentAnime!.id)")
    
    imgView.kf.setImage(with: url)
    setupBackground()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    setupLabels()
    self.hideActivityIndicator()
  }
  
  
  func setupLabels() {
    titleLbl.text = anime?.animeName
    typeLbl.text = anime?.animeType
    premieredLbl.text = anime?.animePremire
    episodesLbl.text = anime?.animeEpisodes
    scoreLbl.text = anime?.animeScore
    rankLbl.text = anime?.animePopularity
    genreLbl.text = anime?.animeGenre.joined(separator: ", ")
  }
  
  func setupBackground() {
    let backgroundImg = UIImageView(frame: UIScreen.main.bounds)
    backgroundImg.kf.setImage(with: url)
    backgroundImg.contentMode = .scaleAspectFill
    view.insertSubview(backgroundImg, at: 0)
    
    let blurEffect = UIBlurEffect(style: .dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = backgroundImg.frame
    view.insertSubview(blurEffectView, at: 1)
  }
  
}
extension DetailsViewController: AnimeManagerDelegate {
  func didFetchAnimeData(_ animeManager: AnimeManager, _ animeData: AnimeModel) {
    anime = animeData
  }
  
  func didFailWithError(_ error: Error) {
    print("AnimeManagerError: \(error)")
  }
  
  
}
