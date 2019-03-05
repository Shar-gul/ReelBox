//
//  TabBarViewController.swift
//  ReelBox
//
//  Created by Tiago Valente on 25/02/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let movieListViewController = MovieListTableViewController()
        movieListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        
        let movieSearchViewController = MovieSearchViewController()
        movieSearchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        let tabBarList = [movieListViewController, movieSearchViewController]
        viewControllers = tabBarList
    }
}
