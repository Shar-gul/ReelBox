//
//  MovieListTableViewController.swift
//  ReelBox
//
//  Created by Tiago Valente on 18/02/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    var movieList : [NowPlayingObject]? {didSet {tableView.reloadData() }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieTableCell")
        
        NowPlaying.requestNowPlaying(success: { [unowned self] (result) in
            DispatchQueue.main.async {
                self.movieList = result
            }
        }) { (error) in
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var elements = 0
        if let list = movieList {
            elements = list.count
        }
        return elements
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "movieTableCell", for: indexPath) as! MovieTableViewCell
        if let list = movieList {
            cell.labelTitle.text = list[indexPath.item].title
            cell.imageUrl = list[indexPath.item].posterPath
        }
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movieDetailVC = MovieDetailViewController()
        self.navigationController?.pushViewController(movieDetailVC, animated: true)
        
    }
}
