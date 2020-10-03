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
  @IBOutlet weak var episodesVolumesLbl: UILabel!
  @IBOutlet weak var episodesLbl: UILabel!
  @IBOutlet weak var premieredChaptersLbl: UILabel!
  @IBOutlet weak var premieredLbl: UILabel!
  @IBOutlet weak var studioAuthorLbl: UILabel!
  @IBOutlet weak var studioLbl: UILabel!
  @IBOutlet weak var airedPublishedLbl: UILabel!
  @IBOutlet weak var genreLbl: UILabel!
  @IBOutlet weak var scoreLbl: UILabel!
  @IBOutlet weak var rankLbl: UILabel!
  @IBOutlet weak var synopisLbl: UILabel!
  @IBOutlet weak var japanNameLbl: UILabel!
  @IBOutlet weak var engNameLbl: UILabel!
  @IBOutlet weak var otherNamesLbl: UILabel!
  @IBOutlet weak var airedLbl: UILabel!
  
  var parentAnime: TopAnimeManga?
  
  var anime: AnimeModel?
  var animeManager = AnimeManager()
  
  var manga: MangaModel?
  var mangaManager = MangaManager()
  
  var id = String()
  
  var url : URL? {
    return URL(string: parentAnime!.imageURL)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    animeManager.delegate = self
    mangaManager.delegate = self
    
    
    animeMangaRequest()
    imgView.kf.setImage(with: url)
    setupBackground()
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabel(_:)))
    synopisLbl.addGestureRecognizer(tap)
    synopisLbl.numberOfLines = 5
    
  }
  
  private func animeMangaRequest() {
    showActivityIndicator()
    
    if id == K.animeID {
      animeManager.performRequest(animeID: "\(parentAnime!.id)") { (result) in
        switch result {
        case .success(let animeModel):
          self.animeManager.delegate?.didFetchAnimeData(animeModel)
          DispatchQueue.main.async {
            self.setupLabels()
          }
        case .failure(let error):
          self.animeManager.delegate?.didFailWithError(error)
        }
      }
    } else {
      mangaManager.performRequest(mangaID: "\(parentAnime!.id)", mangaRequest: "") { (result) in
        switch result {
        case .success(let mangaModel):
          self.mangaManager.delegate?.didFetchMangaData(mangaModel)
          DispatchQueue.main.async {
            self.setupLabels()
          }
        case .failure(let error):
          self.mangaManager.delegate?.didFailWithError(error)
        }
      }
    }
  }
  
  
  
  func setupLabels() {
    if id == K.animeID {
      titleLbl.text = anime?.animeName
      typeLbl.text = anime?.animeType
      premieredLbl.text = anime?.animePremire
      episodesLbl.text = anime?.animeEpisodes
      scoreLbl.text = anime?.animeScore
      rankLbl.text = "#" + "\(anime!.animeRank)"
      genreLbl.text = anime?.animeGenre.joined(separator: ", ")
      studioLbl.text = anime?.animeStudio.joined(separator: ", ")
      synopisLbl.text = anime?.animeDetails
      japanNameLbl.text = anime?.animeJapanName
      engNameLbl.text = anime?.animeName
      otherNamesLbl.text = anime?.animeOtherNames.joined(separator: ", ")
      airedLbl.text = anime!.animeAired
      
      episodesVolumesLbl.text = "EPISODES"
      premieredChaptersLbl.text = "SEASON"
      studioAuthorLbl.text = "STUDIO"
      airedPublishedLbl.text = "AIRED"
      
    } else {
      titleLbl.text = manga?.mangaName
      typeLbl.text = manga?.mangaType
      premieredLbl.text = manga?.mangaChapters
      episodesLbl.text = manga?.mangaVolumes
      scoreLbl.text = manga?.mangaScore
      rankLbl.text = "#" + "\(manga!.mangaRank)"
      genreLbl.text = manga?.mangaGenre.joined(separator: ", ")
      studioLbl.text = manga?.mangaAuthors.joined(separator: ", ")
      synopisLbl.text = manga?.mangaDetails
      japanNameLbl.text = manga?.mangaJapanName
      engNameLbl.text = manga?.mangaEnglishName
      otherNamesLbl.text = manga?.mangaOtherNames.joined(separator: ", ")
      airedLbl.text = manga?.mangaPublished
      
      episodesVolumesLbl.text = "VOLUMES"
      premieredChaptersLbl.text = "CHAPTERS"
      studioAuthorLbl.text = "AUTHOR"
      airedPublishedLbl.text = "PUBLISHED"
    }
    self.hideActivityIndicator()
  }
  
  @objc func tapLabel(_ tapGesture: UITapGestureRecognizer) {
    if let label = tapGesture.view as? UILabel {
      label.numberOfLines = label.numberOfLines == 0 ? 5 : 0
      UIView.animate(withDuration: 0.5) {
        label.superview?.layoutIfNeeded()
      }
    }
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
  func didFetchAnimeData(_ animeModel: AnimeModel) {
    anime = animeModel
  }
  
  func didFailWithError(_ error: Error) {
    print("AnimeManagerError: \(error)")
  }
}

extension DetailsViewController: MangaManagerDelegate {
  func didFetchMangaData(_ mangaModel: MangaModel) {
    manga = mangaModel
  } 
}
