//
//  UIButton Extension.swift
//  TopAnime
//
//  Created by Anton on 10/18/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit

extension UIButton {
  
  func centerVertically(padding: CGFloat = -20.0) {
    guard
      let imageViewSize = self.imageView?.frame.size,
      let titleLabelSize = self.titleLabel?.frame.size else {
        return
    }
    
    let totalHeight = imageViewSize.height + titleLabelSize.height + padding
    
    self.imageEdgeInsets = UIEdgeInsets(
      top: 0,
      left: 0.0,
      bottom: 0.0,
      right: -titleLabelSize.width
    )
    
    self.titleEdgeInsets = UIEdgeInsets(
      top: 0.0,
      left: -imageViewSize.width,
      bottom: -(totalHeight - titleLabelSize.height),
      right: 0.0
    )
    
    self.contentEdgeInsets = UIEdgeInsets(
      top: 0.0,
      left: 0.0,
      bottom: titleLabelSize.height,
      right: 0.0
    )
  }
}
