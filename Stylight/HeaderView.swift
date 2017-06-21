//
//  HeaderView.swift
//  Stylight
//
//  Created by Mohamed Magdy on 6/21/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    //MARK:- Computed Properties
    var viewText: String? {
        didSet {
            addLabel()
        }
    }
    //MARK:- Private Properties
    var label: UILabel?
    
    
    //MARK:- Init 
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    private func addLabel() {
        label?.removeFromSuperview()
        label = UILabel()
        self.addSubview(label!)
        
        label?.text = viewText
        label?.sizeToFit()
        self.layoutIfNeeded()
        label?.center = self.center

    }

}
