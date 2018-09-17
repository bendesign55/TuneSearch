//
//  ResultTableViewModel.swift
//  TuneSearch
//
//  Created by Ben Ormos on 17/09/2018.
//  Copyright © 2018 com.benormos. All rights reserved.
//

import Foundation

class ResultTableViewModel {
    
    private var results: [SearchCriteria] = []
    private var searchState: SearchType = .artist
    private var selectedResult: SearchCriteria?
    
    func searchFor(_ keyword: String, completion: @escaping (Bool) -> ()) {
        Result.allResults(searchState, keyword: keyword) { (result) in
            guard let searchResults = result else { completion(false); return }
            self.results = searchResults
            completion(true)
        }
    }
    
    func resultForIndex(_ index: Int) -> SearchCriteria {
        return results[index]
    }
    
    func numberOfResults() -> Int {
        return results.count
    }
    
    func selectResult(_ index: Int) {
        selectedResult = results[index]
    }
    
    func getResult() -> SearchCriteria? {
        return selectedResult
    }
    
    func setSelectionState(_ index: Int) {
        switch index {
        case 0:
            searchState = .artist
        case 1:
            searchState = .album
        case 2:
            searchState = .track
        default:
            break
        }
    }
    
}
