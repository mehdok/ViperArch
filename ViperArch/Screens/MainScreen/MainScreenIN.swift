//
//  MainScreenIN.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import DomainLayer
import RxSwift

class MainScreenIN: BaseInteractor {
    internal init(foodRepository: FoodRepository) {
        self.foodRepository = foodRepository
    }
    
    let foodRepository: FoodRepository
    
    func getFoodList() -> Single<[FoodCategory]> {
        foodRepository.getFoodList()
    }
}
