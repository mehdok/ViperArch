//
//  OCategory.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/20/20.
//

import ObjectMapper

struct OCategory: BaseResponse {
    var id, name, position: String?
    var menuItems: [OMenuItem]?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        position <- map["position"]
        menuItems <- map["menu-items"]
    }
}
