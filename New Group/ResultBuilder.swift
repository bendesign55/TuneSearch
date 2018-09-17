//
//  ResultBuilder.swift
//  TuneSearch
//
//  Created by Ben Ormos on 17/09/2018.
//  Copyright © 2018 com.benormos. All rights reserved.
//

import Foundation

class ResultBuilder {
    
    static let shared = ResultBuilder()
    
    private init() {
    }
    
    class func resultsFrom(_ match: Match) -> [SearchCriteria]? {
        
        switch match {
        case is Artistmatches:
            return (match as! Artistmatches).artist.compactMap { resultFrom($0) }
        case is Albummatches:
            return (match as! Albummatches).album.compactMap { resultFrom($0) }
        case is Trackmatches:
            return (match as! Trackmatches).track.compactMap { resultFrom($0) }
        default:
            break
        }
        
        return nil
    }
    
    class func resultFrom(_ criteria: SearchCriteria) -> SearchCriteria? {
        
        switch criteria {
        case is Artist:
            let artist = criteria as! Artist
            return artist
        case is Album:
            let album = criteria as! Album
            return album
        case is Track:
            let track = criteria as! Track
            return track
        default:
            break
        }
        
        return nil
    }
    
}
