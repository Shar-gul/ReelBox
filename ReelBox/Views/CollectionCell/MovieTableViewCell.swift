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
    var imageUrl: String? {didSet { requestImage()}}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewMovie.image = UIImage(named: "reel")
    }
    
    private func requestImage() {
        guard let imagePath = imageUrl else {
            return
        }
        guard let urlComp = URLComponents(string: Configurations.imageEndpoint + imagePath) else {
            return
        }
        
        NetworkManager.requestURL(url: urlComp, success: { (dataResult) in
            DispatchQueue.main.async() {
                self.imageViewMovie.image = UIImage(data: dataResult as! Data)
            }
        }) { (error) in
            print(error)
        }
    }
}
