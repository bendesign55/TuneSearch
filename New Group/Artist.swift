//
//  Artist.swift
//  TuneSearch
//
//  Created by Ben Ormos on 17/09/2018.
//  Copyright © 2018 com.benormos. All rights reserved.
//

import Foundation

struct Artistmatches: Codable, Match {
    let artist: [Artist]
}

struct Artist: Codable, SearchCriteria {
    var id: String
    var name: String
    var listeners: String
    var url: String
    var streamable: String
    var image: [Image]
    
    enum CodingKeys: String, CodingKey {
        case id = "mbid"
        case name
        case listeners
        case url
        case streamable
        case image
    }
}
