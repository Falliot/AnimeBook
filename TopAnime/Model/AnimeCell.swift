//
//  AnimeCell.swift
//  TopAnime
//
//  Created by Anton on 9/21/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit

class AnimeCell: UITableViewCell {

  @IBOutlet weak var nameLbl: UILabel!
  @IBOutlet weak var ratingLbl: UILabel!
  @IBOutlet weak var startDate: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    labelColor(labels: nameLbl, ratingLbl, startDate)
    }
  
  func labelColor(labels: UILabel...) {
    for label in labels {
      label.textColor = .black
    }
  }
  
  func setupAnimeCell(_ anime: Top) {
    self.nameLbl?.text = anime.title
    self.ratingLbl?.text = "Score: \(anime.score)"
    self.startDate?.text = anime.startDate
  }
  
  
}
