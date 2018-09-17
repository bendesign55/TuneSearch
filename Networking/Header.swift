//
//  Header.swift
//  TuneSearch
//
//  Created by Ben Ormos on 17/09/2018.
//  Copyright © 2018 com.benormos. All rights reserved.
//

import Foundation

struct Header {
    
    enum HeaderType {
        case unauthenticated
        case tokenJson
    }
    
    static let contentType = "Content-Type"
    static let applicationJson = "application/json"
    
    
    static func header (_ type: HeaderType) -> [String: String] {
        
        switch type {
        case .unauthenticated:
            return [:]
        case .tokenJson:
            return [self.contentType: self.applicationJson]
        }
    }
}
