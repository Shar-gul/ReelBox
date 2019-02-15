//
//  NowPlaying.swift
//  ReelBox
//
//  Created by Tiago Valente on 13/02/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

class NowPlaying : Decodable {
    var results : [NowPlayingObject]
}

extension NowPlaying {
    
    static let REGION_KEY = "region"
    
    class func requestNowPlaying(region: String = "PT", success: @escaping (_ success: NowPlaying) -> Void, failure: @escaping (String) -> Void) {
        
        guard let urlComp = URLComponents(string: Configurations.server + "movie/now_playing?") else {
            failure("")
            return
        }
        
        let params = [REGION_KEY : region,
                      Configurations.API_KEY : Configurations.API_KEY_VALUE]
        
        NetworkManager.requestURL(url: urlComp, parameters: params, success: { (response) in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(NowPlaying.self, from: response as! Data)
                success(results)
            } catch let jsonErr {
                print("Error", jsonErr)
                failure("Error \(jsonErr)")
            }
        }) { (error) in
            print(error)
        }
    }
    
}
