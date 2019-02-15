//
//  NowPlayingObject.swift
//  ReelBox
//
//  Created by Tiago Valente on 13/02/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation


class NowPlayingObject : Decodable {
    
    var voteCount : Int
    var id : Int
    var video : Bool
    var voteAverage : Double
    var title : String
    var popularity : Double
    var posterPath : String?
    var originalLanguage :String
    var originalTitle : String
    var genreIds : [Int]
    var backdropPath : String?
    var adult : Bool
    var overview : String
    var releaseDate : String
}
