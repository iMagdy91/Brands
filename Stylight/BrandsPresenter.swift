//
//  BrandsPresenter.swift
//  Stylight
//
//  Created by Mohamed Magdy on 6/21/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

fileprivate let apiKey = "apiKey"

class BrandsPresenter: BasePresenter {
    
    /**
     get all brands from API.
     
     @param success response success closure
     @param failure response failure block
     
     */

    class func getAllBrandsWithSuccess(success: @escaping ViewModelClosure, failure: @escaping ErrorClosure) {
        
        let parametersDict: [String: Any] = [apiKey: Network.api_key]
        
        NetworkManager.performRequestWithPath(path: Network.path, requestMethod: .get, parameters: parametersDict, headers: nil, success: { (response) in
            
            let brandsModel: BrandsModel? =  Mapper<BrandsModel>().map(JSONObject: response)
            let brands = brandsModel?.brands
            let sortedArray = sortBrandsArray(array: brands)
            success(sortedArray)
            
        }) { (error) in
            failure(error)
        }
    }
    
    /**
    Sort array of type Brands
 
    @param array array to sort
    @return sorted array
     
    */
    class func sortBrandsArray(array: [Brand]?) -> [Brand]? {
        
        return array?.sorted{ $0.name! < $1.name! }
        
    }
}
