//
//  BrandsModel.swift
//  Stylight
//
//  Created by Mohamed Magdy on 6/21/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class BrandsModel: BaseModel {
    
    private(set) var brands: [Brand]?
    
    /**
     mapping from API
     */
    override func mapping(map: Map) {
        brands <- map["brands"]
    }
}

class Brand: BaseModel {
    
    private(set) var id: Int?
    private(set) var logo: String?
    private(set) var name : String?
    var selected: Bool = false
    
    /**
     mapping from API
     */
    override func mapping(map: Map) {
        id <- map["id"]
        logo <- map["logo"]
        name <- map["name"]
    }
}
