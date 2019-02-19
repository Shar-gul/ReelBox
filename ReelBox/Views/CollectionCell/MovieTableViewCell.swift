//
//  MovieTableViewCell.swift
//  ReelBox
//
//  Created by Tiago Valente on 19/02/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        print("Stuff")
    }
}
