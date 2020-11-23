//
//  FoodRepository.swift
//  DomainLayer
//
//  Created by Mehdok on 11/20/20.
//

import RxSwift

public protocol FoodRepository {
    func getFoodList() -> Single<[FoodCategory]>
}
