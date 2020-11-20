//
//  Category.swift
//  DomainLayer
//
//  Created by Mehdok on 11/20/20.
//

public struct Category: BaseEntity {
    public let id, name, position: String
    public let menuItems: [MenuItem]

    enum CodingKeys: String, CodingKey {
        case id, name, position
        case menuItems = "menu-items"
    }
}
