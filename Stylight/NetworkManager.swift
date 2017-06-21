//
//  NetworkManager\.swift
//  Stylight
//
//  Created by Mohamed Magdy on 6/21/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkSuccessClosure = (Any?) -> Void
typealias NetworkErrorClosure = (Error) -> Void

class NetworkManager {
    
    /**
     Requests data from API and get the response back.
     
     @param path API path
     @param requestMethod request method .GET .POST etc..
     @param parameters request parameters
     @param headers request headers
     @param success response success block
     @param failure response failure block
     
     */
    class func performRequestWithPath(path: String?, requestMethod: Alamofire.HTTPMethod, parameters: [String : Any]?, headers: [String : String]?, success:@escaping NetworkSuccessClosure, failure:  @escaping NetworkErrorClosure) {
        
        let url = (path != nil) ? Network.baseURL + path! : Network.baseURL
        Alamofire.request(url, method: requestMethod, parameters: parameters, headers: headers)
            .validate()
            .responseJSON { response in
                
                switch response.result {
                    
                case .success(_):
                    success(response.result.value)
                case .failure(let error):
                    failure(error)
                }
        }
    }
}
