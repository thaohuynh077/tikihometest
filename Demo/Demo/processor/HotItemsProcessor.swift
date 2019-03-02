//
//  HotItemsProcessor.swift
//  Demo
//
//  Created by admin on 3/2/19.
//

import Alamofire
import Foundation

class HotItemsProcessor: IHotItemsProcessor {
    
    init() {
    }
    
    func getItems(callback: @escaping (Bool, ArrayResponse) -> Void) {
        let api = HotItemsApi()
        api.getItems { success , response in
            callback(true, response)
        }
    }
    
}
