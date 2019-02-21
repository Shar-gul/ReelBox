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
    @IBOutlet var backgroundTitleView: UIView!
    @IBOutlet weak var labelTitle: UILabel! {didSet {
        labelTitle.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        labelTitle.textColor = UIColor.white
        colors = [UIColor.lightGray.withAlphaComponent(0.35),UIColor.clear]
    }}
    var imageUrl: String? {didSet { requestImage()}}
    private let gradientLayer = RadialGradientLayer()
    
    var colors: [UIColor] {
        get {
            return gradientLayer.colors
        }
        set {
            gradientLayer.colors = newValue
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.superlayer == nil {
            backgroundTitleView.layer.insertSublayer(gradientLayer, at: 0)
        }
        gradientLayer.frame = bounds
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func requestImage() {
        
        guard let imagePath = imageUrl, !imagePath.isEmpty, let urlComp = URLComponents(string: Configurations.imageEndpoint + imagePath) else {
            imageViewMovie.contentMode = .scaleAspectFit
            imageViewMovie.image = UIImage(named: "reel")
            return
        }
        
        NetworkManager.requestURL(url: urlComp, success: { (dataResult) in
            DispatchQueue.main.async() {
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
