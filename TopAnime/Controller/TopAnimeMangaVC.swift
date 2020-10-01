//
//  AnimeTableViewController.swift
//  TopAnime
//
//  Created by Anton on 9/21/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit

class TopTableViewController: UITableViewController {
  
  var animeMangaList = [TopAnimeManga]()
  var request = TopManager()
  
  var topType = String()
  var topPage = "1"
  var topSubType = String()

  @IBOutlet var animeTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animeTableView.register(UINib(nibName: K.cellIdentifier, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    request.delegate = self
    request.fetchTop(topType, topPage, topSubType)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animeMangaList.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: K.SegueIdentifiers.toDetails, sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? DetailsViewController {
      let index = tableView.indexPathForSelectedRow?.row
      destination.parentAnime = animeMangaList[index!]
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = animeTableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! AnimeCell
    let anime = animeMangaList[indexPath.row]
    cell.setupAnimeCell(anime)
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
}


extension TopTableViewController: TopManagerDelegate {
  func didFetchTopAnimeManga(_ topManager: TopManager, _ top: TopModel) {
    for item in top.top {
      self.animeMangaList.append(item)
    }
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
  func didFailWithError(_ error: Error) {
    print(error)
  }
}
