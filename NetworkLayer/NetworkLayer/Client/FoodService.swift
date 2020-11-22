//
//  FoodService.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/20/20.
//

import Moya

enum FoodService {
    case foodCategory
}

extension FoodService: TargetType {
    public var baseURL: URL {
        URL(string: "https://nop.com")!
    }

    public var path: String {
        switch self {
        case .foodCategory:
            return "/food_category"
        }
    }

    public var sampleData: Data {
        switch self {
        case .foodCategory:
            return getMockJson("food_sample")
        }
    }

    public var headers: [String: String]? {
        ["Content-type": "application/json"]
    }

    var method: Moya.Method {
        switch self {
        case .foodCategory:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .foodCategory:
            return .requestPlain
        }
    }
}

extension FoodService {
    func getMockJson(_ name: String) -> Data {
        guard let url = Bundle(identifier: "com.mehdok.NetworkLayer")?
            .url(forResource: name, withExtension: ".json"),
            let data = try? Data(contentsOf: url)
        else {
            return Data()
        }

        return data
    }
}
