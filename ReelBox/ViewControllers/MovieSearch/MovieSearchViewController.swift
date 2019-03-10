//
//  MovieSearchViewController.swift
//  ReelBox
//
//  Created by Tiago Valente on 05/03/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {

    @IBOutlet weak var resultTableView: UITableView!
    var searchController: UISearchController?
    
    var movieResults : [MovieObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.register(UITableViewCell.self, forCellReuseIdentifier: "resultCell")
        
        searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            resultTableView.tableHeaderView = controller.searchBar
            
            return controller
        })()

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchString = searchController.searchBar.text, !searchString.isEmpty, searchString.count > 2 {
            SearchMovie.requestSearchMovie(query: searchString, success: { [weak self] (result) in
                self?.movieResults = result.results
                DispatchQueue.main.async {
                    self?.resultTableView.reloadData()
                }
            }) { (result) in
                print("Error")
            }
            
        } else {
            movieResults = []
            resultTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        cell.textLabel?.text = movieResults?[indexPath.row].originalTitle
        return cell
    }
}
