//
//  Result.swift
//  TuneSearch
//
//  Created by Ben Ormos on 17/09/2018.
//  Copyright © 2018 com.benormos. All rights reserved.
//

import Foundation
import UIKit

protocol Match {}

protocol SearchCriteria {
    var id: String { get set }
    var name: String { get set }
    var url: String { get set }
    var image: [Image] { get set }
}

struct Result {
    var id: String
    var title: String
    var imageUrl: String
    var type: SearchType
}


extension Result {
    static func allResults(_ searchType: SearchType, keyword: String, completion: @escaping ([SearchCriteria]?) -> ()) {
        APIClient().searchForKeywordWithType(searchType, keyword: keyword) { (response, error) in
            if error == nil {
                guard let response = response else { return }
                do {
                    
                    let decoder = JSONDecoder()
                    
                    guard let json = try JSONSerialization.jsonObject(with: response) as? [String: Any] else { return }
                    if let results = json["results"] as? [String: Any] {
                        if let artistmatches = results["artistmatches"] as? [String: Any] {
                            if let jsonData = try? JSONSerialization.data(withJSONObject:artistmatches) {
                                let artistMatches = try decoder.decode(Artistmatches.self, from: jsonData)
                                completion(ResultBuilder.resultsFrom(artistMatches))
                            }
                        } else if let trackmatches = results["trackmatches"] as? [String: Any] {
                            if let jsonData = try? JSONSerialization.data(withJSONObject:trackmatches) {
                                let trackMatches = try decoder.decode(Trackmatches.self, from: jsonData)
                                completion(ResultBuilder.resultsFrom(trackMatches))
                            }
                        } else if let albummatches = results["albummatches"] as? [String: Any] {
                            if let jsonData = try? JSONSerialization.data(withJSONObject:albummatches) {
                                let albumMatches = try decoder.decode(Albummatches.self, from: jsonData)
                                completion(ResultBuilder.resultsFrom(albumMatches))
                            }
                        }
                    }
                    
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
            } else {
                
            }
        }
    }
}
