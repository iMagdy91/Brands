//
//  BrandsTableViewCell.swift
//  Stylight
//
//  Created by Mohamed Magdy on 6/21/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit
import Kingfisher

class BrandsTableViewCell: UITableViewCell {

    
    //MARK:- Outlets
    @IBOutlet private weak var brandNameLabel: UILabel!
    @IBOutlet private weak var brandImage: UIImageView!

    
    
    //MARK:- Cell Customization
    func customizeCellForBrand(brand: Brand?, checkmark: Bool) {
        brandNameLabel.text = brand?.name
        if let logo = brand?.logo {
            let imageURL = URL(string: logo)
            brandImage.kf.setImage(with: imageURL)
        }
        accessoryType = checkmark ? .checkmark : .none
        selectionStyle = .none
    }
    
}
