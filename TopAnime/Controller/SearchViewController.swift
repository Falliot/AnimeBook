//
//  ViewController.swift
//  TopAnime
//
//  Created by Anton on 10/18/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit
import SwipeableTabBarController

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      Utility.setupBackground(view: self.view, url: nil, image: "collage2")
      navigationController?.navigationBar.isHidden = true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
