//
//  AnimeCell.swift
//  TopAnime
//
//  Created by Anton on 9/21/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit
import Kingfisher

class AnimeCell: UITableViewCell {

  @IBOutlet weak var nameLbl: UILabel!
  @IBOutlet weak var imgView: UIImageView!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
  
  func setupAnimeCell(_ anime: TopAnimeManga) {
    self.nameLbl?.text = anime.title + " (\(anime.type))"
    self.imgView.kf.setImage(with: URL(string: anime.imageURL))
  }
  
  func setupGenre(_ genre: Anime) {
    self.nameLbl.text = genre.name
    self.imgView.kf.setImage(with: URL(string: genre.imageURL))
  }
  
}
