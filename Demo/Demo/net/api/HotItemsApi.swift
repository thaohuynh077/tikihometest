//
//  HotItemsApi.swift
//  Demo
//
//  Created by admin on 3/2/19.
//

//import UIKit
import Alamofire
import AlamofireObjectMapper

class HotItemsApi {
    
    init() {
        
    }
    
    // GET /item
    func getItems(callback: @escaping (Bool, ArrayResponse) -> Void) {
        let url = "https://tiki-mobile.s3-ap-southeast-1.amazonaws.com/ios/keywords.json"
        Alamofire.request(url).responseObject { (response: DataResponse<ArrayResponse>) in
            if let value = response.result.value {
                callback(true, value)
            }
        }
    }
}



