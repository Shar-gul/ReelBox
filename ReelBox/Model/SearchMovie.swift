//
//  SearchMovie.swift
//  ReelBox
//
//  Created by Tiago Valente on 10/03/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

class SearchMovie : Decodable {
    
    var page : Int
    var totalResults : Int
    var totalPages : Int
    var results : [MovieObject]
    
}

extension SearchMovie {
    
    static let QUERY_KEY = "query"
    
    class func requestSearchMovie(query: String, success: @escaping (_ success: SearchMovie) -> Void, failure: @escaping (String) -> Void) {
        
        guard let urlComp = URLComponents(string: Configurations.server + "search/movie?") else {
            failure("")
            return
        }
        
        let params = [QUERY_KEY : query,
                      Configurations.API_KEY : Configurations.API_KEY_VALUE]
        
        NetworkManager.requestURL(url: urlComp, parameters: params, success: { (response) in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let resultObject = try decoder.decode(SearchMovie.self, from: response as! Data)
                success(resultObject)
            } catch let jsonErr {
                print("Error", jsonErr)
                failure("Error \(jsonErr)")
            }
        }) { (error) in
            print(error)
        }
    }
}
