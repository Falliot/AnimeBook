//
//  TabViewController.swift
//  TopAnime
//
//  Created by Anton on 10/18/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//
import SwipeableTabBarController
import UIKit

class TabBarController: SwipeableTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /// Set the animation type for swipe
        swipeAnimatedTransitioning?.animationType = SwipeAnimationType.sideBySide
    }
}
