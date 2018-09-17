//
//  URLManager.swift
//  TuneSearch
//
//  Created by Ben Ormos on 17/09/2018.
//  Copyright © 2018 com.benormos. All rights reserved.
//

import Foundation

struct URLManager {
    
    static let baseURL = "http://ws.audioscrobbler.com"
    static let apiVersion = "/2.0"
    
    static func apiBaseURL() -> String {
        return "\(baseURL)\(apiVersion)"
    }
    
}
