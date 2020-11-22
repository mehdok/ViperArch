//
//  Category.swift
//  DomainLayer
//
//  Created by Mehdok on 11/20/20.
//

public struct FoodCategory: BaseEntity {
    public init(id: String?, name: String?, position: String?, menuItems: [MenuItem]?) {
        self.id = id
        self.name = name
        self.position = position
        self.menuItems = menuItems
    }

    public let id, name, position: String?
    public let menuItems: [MenuItem]?

    enum CodingKeys: String, CodingKey {
        case id, name, position
        case menuItems = "menu-items"
    }
}
