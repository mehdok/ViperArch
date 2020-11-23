//
//  MainScreenPR.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import DomainLayer
import RxCocoa
import RxSwift

enum FoodCategoryResult {
    case loading
    case success([FoodCategory]?)
    case error(Error?)
}

class MainScreenPR: BasePresenter<MainScreenIN> {
    var isLoading: Driver<Bool>?
    var hasFailed: Driver<Error?>?
    var hasSucced: Driver<[FoodCategory]>?

    func bindViewDidLoad(_ vdl: Driver<Void>) {
        let state = vdl
            .flatMapLatest { _ -> Driver<FoodCategoryResult> in
                self.interactor.getFoodList()
                    .observeOn(MainScheduler.instance)
                    .map { foodCategory -> FoodCategoryResult in
                        .success(foodCategory)
                    }
                    .catchError {
                        Single.just(FoodCategoryResult.error($0))
                    }
                    .asDriver { error -> Driver<FoodCategoryResult> in
                        Driver.just(.error(error))
                    }
                    .startWith(.loading)
            }

        isLoading = state
            .map { event in
                switch event {
                case .loading: return true
                default: return false
                }
            }
            .distinctUntilChanged()

        hasFailed = state
            .map { event in
                switch event {
                case let .error(error): return error
                default: return nil
                }
            }
            .filter { $0 != nil }

        hasSucced = state
            .map { event -> [FoodCategory]? in
                switch event {
                case let .success(categories): return categories
                default: return nil
                }
            }
            .filter { $0 != nil }
            .map { $0! }
    }
}
