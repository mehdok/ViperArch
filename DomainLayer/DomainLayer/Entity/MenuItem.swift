//
//  MenuItem.swift
//  DomainLayer
//
//  Created by Mehdok on 11/20/20.
//

public struct MenuItem: BaseEntity {
    public init(id: String?, name: String?, position: Int?, description: String?, images: [String]?) {
        self.id = id
        self.name = name
        self.position = position
        self.description = description
        self.images = images
    }

    public let id, name: String?
    public let position: Int?
    public let description: String?
    public let images: [String]?
}
