//
//  Shared.swift
//  TopAnime
//
//  Created by Anton on 10/3/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit

struct Genres {
  static let animeGenres = ["Action", "Adventure", "Cars", "Comedy", "Dementia", "Demons", "Mystery", "Drama", "Ecchi", "Fantasy", "Game", "Hentai", "Historical", "Horror", "Kids", "Magic", "Martical Arts", "Mecha", "Music", "Parody", "Samurai", "Romance", "School", "Sci Fi", "Shoujo", "Shoujo Ai", "Shounen", "Shounen Ai", "Space", "Sports", "Super Power", "Vampire", "Yaoi", "Yuri", "Harem", "Slice Of Life", "Supernatural", "Military", "Police", "Psychological", "Thriller", "Seinen", "Josei"]
  static let mangaGenres = ["Action", "Adventure", "Cars", "Comedy", "Dementia", "Demons", "Mystery", "Drama", "Ecchi", "Fantasy", "Game", "Hentai", "Historical", "Horror", "Kids", "Magic", "Martical Arts", "Mecha", "Music", "Parody", "Samurai", "Romance", "School", "Sci Fi", "Shoujo", "Shoujo Ai", "Shounen", "Shounen Ai", "Space", "Sports", "Super Power", "Vampire", "Yaoi", "Yuri", "Harem", "Slice Of Life", "Supernatural", "Military", "Police", "Psychological", "Thriller", "Seinen", "Josei", "Gender Bender", "Thriller"]
}

struct Utility {
  
  static func setupBackground(view: UIView, url: URL?, image: String?) {
    let backgroundImg = UIImageView(frame: UIScreen.main.bounds)
    backgroundImg.contentMode = .scaleToFill
    view.insertSubview(backgroundImg, at: 0)
    
    if url != nil {
      backgroundImg.kf.setImage(with: url)
      let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
      blurEffectView.frame = backgroundImg.frame
      view.insertSubview(blurEffectView, at: 1)
    } else {
      backgroundImg.image = UIImage(named: image!)
    }
  }
  
  static func attributedButtons(button: UIButton,imageName: String, title: String) {
    button.clipsToBounds = true
    button.layer.cornerRadius = button.frame.width/10
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 1.0
    
    button.imageView?.contentMode = .scaleAspectFit
    button.setImage(UIImage(named:imageName), for: .normal)
    button.setTitle(title, for: .normal)
  }
  
}

