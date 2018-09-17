//
//  Image.swift
//  TuneSearch
//
//  Created by Ben Ormos on 17/09/2018.
//  Copyright © 2018 com.benormos. All rights reserved.
//

import Foundation

struct Image: Codable {
    var url: String
    var size: String
    
    enum CodingKeys: String, CodingKey {
        case url = "#text"
        case size = "size"
    }
}
