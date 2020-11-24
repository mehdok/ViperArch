//
//  FoodSection.swift
//  ViperArch
//
//  Created by Mehdok on 11/24/20.
//

import DomainLayer
import RxDataSources

struct SectionOfFood {
    var header: String
    var items: [MenuItem]
}

extension SectionOfFood: SectionModelType {
    typealias Item = MenuItem

    init(original: SectionOfFood, items: [MenuItem]) {
        self = original
        self.items = items
    }
}
