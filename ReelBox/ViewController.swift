//
//  ViewController.swift
//  ReelBox
//
//  Created by Tiago Valente on 13/02/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NowPlaying.requestNowPlaying(success: { (result) in
            print(result)
        }) { (error) in
            print(error)
        }
        
    }


}

