//
//  GCDHelper.swift
//  TuneSearch
//
//  Created by Ben Ormos on 17/09/2018.
//  Copyright © 2018 com.benormos. All rights reserved.
//

import Foundation

func doInBackground(_ block: @escaping () -> ()) {
    DispatchQueue.global(qos: .default).async {
        block()
    }
}

func doOnMain(_ block: @escaping () -> ()) {
    DispatchQueue.main.async {
        block()
    }
}
