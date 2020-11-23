//
//  FoodRepositoryImpl.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/20/20.
//

import DomainLayer
import Moya
import RxSwift
import Moya_ObjectMapper

struct FoodRepositoryImpl: FoodRepository {
    let service: MoyaProvider<FoodService>

    func getFoodList() -> Single<[FoodCategory]> {
        service.rx.request(.foodCategory)
            .mapArray(OFoodCategory.self)
            .map { (categories) -> [FoodCategory] in
                categories.map { $0.entity }
            }
    }
}
