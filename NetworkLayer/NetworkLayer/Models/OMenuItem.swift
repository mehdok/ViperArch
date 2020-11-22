//
//  OMenuItem.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/20/20.
//

import DomainLayer
import ObjectMapper

struct OMenuItem: BaseResponse {
    var id, name: String?
    var position: Int?
    var description: String?
    var images: [String]?

    init?(map _: Map) {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        position <- map["position"]
        description <- map["description"]
        images <- map["images"]
    }
}

extension OMenuItem {
    var entity: MenuItem {
        MenuItem(id: id, name: name, position: position, description: description, images: images)
    }
}
