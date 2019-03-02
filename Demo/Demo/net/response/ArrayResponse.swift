//
//  ArrayResponse.swift
//  Demo
//
//  Created by admin on 3/2/19.
//

import ObjectMapper

struct ArrayResponse: Mappable {
    var keywords: [HotItemsResponse]?
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        keywords <- map["keywords"]
    }
}
