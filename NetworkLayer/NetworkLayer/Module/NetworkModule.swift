//
//  NetworkModule.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/20/20.
//

import DomainLayer
import Moya

public protocol NetworkModuleType {
    func component() -> FoodRepository
}

public struct NetworkModule: NetworkModuleType {
    public init() {}

    public func component() -> FoodRepository {
        FoodRepositoryImpl(service: component())
    }
}

extension NetworkModule {
    private func component() -> MoyaProvider<FoodService> {
        MoyaProvider<FoodService>(stubClosure: MoyaProvider.immediatelyStub)
    }
}
