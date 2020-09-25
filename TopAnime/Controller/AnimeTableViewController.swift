//
//  AnimeTableViewController.swift
//  TopAnime
//
//  Created by Anton on 9/21/20.
//  Copyright © 2020 falli_ot. All rights reserved.
//

import UIKit

class AnimeTableViewController: UITableViewController {
  
  var animeList = [Top]()
  let urlRequest = Request()
  
  @IBOutlet var animeTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    animeTableView.register(UINib(nibName: "AnimeCell", bundle: nil), forCellReuseIdentifier: "AnimeCell")
    
    urlRequest.fetchData { (result) in
      switch result {
      case .success(let animeData):
        self.animeList.append(contentsOf: animeData)
        DispatchQueue.main.async {
          self.animeTableView.reloadData()
        }
      case .failure(let error):
        print(error)
      }
    }
  }
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animeList.count ?? 0
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "toDetails", sender: self)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? DetailsViewController {
      destination.anime = animeList[(tableView.indexPathForSelectedRow?.row)!]
    }
  }
  
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = animeTableView.dequeueReusableCell(withIdentifier: "AnimeCell", for: indexPath) as! AnimeCell
    
    let anime = animeList[indexPath.row]
    cell.setupAnimeCell(anime)
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}
