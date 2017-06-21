//
//  BaseModel.swift
//  Stylight
//
//  Created by Mohamed Magdy on 6/21/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseModel: Mappable {
    
    //MARK:- Init
    required init?(map: Map) {
    }
    
    /**
     mapping from API
     */
    func mapping(map: Map) {
    }
    
}
