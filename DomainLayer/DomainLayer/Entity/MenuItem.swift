//
//  MenuItem.swift
//  DomainLayer
//
//  Created by Mehdok on 11/20/20.
//

public struct MenuItem: BaseEntity {
    public let id, name: String
    public let position: Int
    public let description: String
    public let images: [String]
}
