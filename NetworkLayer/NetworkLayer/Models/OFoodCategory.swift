//
//  OCategory.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/20/20.
//

import DomainLayer
import ObjectMapper

struct OFoodCategory: BaseResponse {
    var id, name, position: String?
    var menuItems: [OMenuItem]?

    init?(map _: Map) {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        position <- map["position"]
        menuItems <- map["menu-items"]
    }
}

extension OFoodCategory {
    var entity: FoodCategory {
        FoodCategory(id: id, name: name, position: position, menuItems: menuItems?.map { $0.entity })
    }
}
