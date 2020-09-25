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
  @IBOutlet weak var someLbl: UILabel!
  
  var anime: Top?
  
  var url : URL? {
    return URL(string: anime!.imageURL)
  }

  override func viewDidLoad() {
        super.viewDidLoad()
    title = anime?.title
    imgView.kf.setImage(with: url)
      
    }
}
