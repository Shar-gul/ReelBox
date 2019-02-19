//
//  MovieListTableViewController.swift
//  ReelBox
//
//  Created by Tiago Valente on 18/02/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    let movieList = ["One","Two","Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "movieTableCell")
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieTableCell")
        
//        NowPlaying.requestNowPlaying(success: { (result) in
//            print(result)
//        }) { (error) in
//            print(error)
//        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "movieTableCell", for: indexPath) as! MovieTableViewCell

        let item = movieList[indexPath.item]
        cell.labelTitle.text = item

        return cell
    }
 
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150.0
//    }
}
