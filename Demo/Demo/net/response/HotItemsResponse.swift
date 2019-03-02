//
//  HotItemsResponse.swift
//  Demo
//
//  Created by admin on 3/2/19.
//

import ObjectMapper

struct HotItemsResponse: Mappable {
    var keyword: String!
    var icon: String!
    
    init?(map: Map) { }
    init(other: HotItemsResponse) {
        self.keyword = other.keyword
        self.icon = other.icon
    }
    
    mutating func mapping(map: Map) {
        keyword <- map["keyword"]
        icon <- map["icon"]
    }
}
