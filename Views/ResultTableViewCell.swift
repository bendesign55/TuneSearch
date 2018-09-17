//
//  ResultTableViewCell.swift
//  TuneSearch
//
//  Created by Ben Ormos on 17/09/2018.
//  Copyright © 2018 com.benormos. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var resultTitleLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    func configure(_ result: SearchCriteria) {
        resultTitleLabel.text = result.name
        resultImageView.imageFromServerURL(result.image[2].url, placeHolder: nil)
    }

}
