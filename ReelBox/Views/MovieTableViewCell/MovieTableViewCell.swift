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
    @IBOutlet weak var labelTitle: UILabel! {didSet {
        labelTitle.font = UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.bold)
        labelTitle.textColor = UIColor.white
    }}
    var imageUrl: String? {didSet { requestImage()}}
    let gradientLayer = CAGradientLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.superlayer == nil {
            imageViewMovie.layoutIfNeeded()
            
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.35).cgColor]
            gradientLayer.frame = CGRect(x: 0, y: 0, width: imageViewMovie.frame.width, height: imageViewMovie.frame.height)
            
            imageViewMovie.layer.addSublayer(gradientLayer)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        gradientLayer.isHidden = true
        imageViewMovie.layer.cornerRadius = 4.0
        imageViewMovie.clipsToBounds = true
    }
    
    private func requestImage() {
        
        guard let imagePath = imageUrl, !imagePath.isEmpty, let urlComp = URLComponents(string: Configurations.imageEndpoint + imagePath) else {
            imageViewMovie.contentMode = .scaleAspectFit
            imageViewMovie.image = UIImage(named: "reel")
            return
        }
        
        NetworkManager.requestURL(url: urlComp, success: { (dataResult) in
            DispatchQueue.main.async() {
                self.gradientLayer.isHidden = false
                self.imageViewMovie.contentMode = .scaleAspectFill
                self.imageViewMovie.image = UIImage(data: dataResult as! Data)
            }
        }) { (error) in
            print(error)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewMovie.image = nil
        labelTitle.text = ""
    }
}
