//
//  UIActivityIndicator Extension.swift
//  TopAnime
//
//  Created by Anton on 9/30/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit

/// Used for ViewControllers that need to present an activity indicator when loading data.
public protocol ActivityIndicatorPresenter {
  
  /// The activity indicator
  var activityIndicator: UIActivityIndicatorView { get }
  
  var greyView: UIView { get set}
  /// Show the activity indicator in the view
  func showActivityIndicator()
  
  /// Hide the activity indicator in the view
  func hideActivityIndicator()
}


public extension ActivityIndicatorPresenter where Self: UIViewController {
  
  func showActivityIndicator() {
    DispatchQueue.main.async {
      
      self.greyView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
      self.greyView.backgroundColor = .black
      self.greyView.alpha = 0.75
      self.view.isUserInteractionEnabled = false
      self.view.addSubview(self.greyView)
      
      self.activityIndicator.style = UIActivityIndicatorView.Style.large
      self.activityIndicator.color = .white
      self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80) //or whatever size you would like
      self.activityIndicator.center = self.view.center
      
      self.view.addSubview(self.activityIndicator)
      self.activityIndicator.startAnimating()
    }
  }
  
  func hideActivityIndicator() {
    DispatchQueue.main.async {
      self.view.isUserInteractionEnabled = true
      self.activityIndicator.stopAnimating()
      self.activityIndicator.removeFromSuperview()
      self.greyView.removeFromSuperview()
    }
  }
}
