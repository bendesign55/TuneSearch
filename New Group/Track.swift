//
//  Song.swift
//  TuneSearch
//
//  Created by Ben Ormos on 17/09/2018.
//  Copyright © 2018 com.benormos. All rights reserved.
//

import Foundation

struct Trackmatches: Codable, Match {
    let track: [Track]
}

struct Track: Codable, SearchCriteria {
    var id: String
    var name: String
    var artist: String
    var listeners: String
    var url: String
    var streamable: String
    var image: [Image]
    
    enum CodingKeys: String, CodingKey {
        case id = "mbid"
        case name
        case artist
        case listeners
        case url
        case streamable
        case image
    }
}
