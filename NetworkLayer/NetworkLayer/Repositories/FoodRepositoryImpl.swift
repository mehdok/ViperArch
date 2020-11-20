//
//  FoodRepositoryImpl.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/20/20.
//

import DomainLayer
import Moya
import RxSwift

struct FoodRepositoryImpl: FoodRepository {
    let service: MoyaProvider<FoodService>

    func getFoodList() -> Observable<[FoodCategory]> {
        service.rx.request(.foodCategory).asObservable()
            .mapArray(type: OFoodCategory.self)
            .map { (categories) -> [FoodCategory] in
                categories.map { $0.entity }
            }
    }
}
