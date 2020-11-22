//
//  BaseResponse.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/20/20.
//

import ObjectMapper
import RxSwift

protocol BaseResponse: Mappable {}

extension BaseResponse {}

public extension ObservableType {
    func mapObject<T: Mappable>(type _: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            let json = data as AnyObject
            guard let object = Mapper<T>().map(JSONObject: json) else {
                throw self.getError(json: json)
            }

            return Observable.just(object)
        }
    }

    func mapArray<T: Mappable>(type _: T.Type) -> Observable<[T]> {
        return flatMap { data -> Observable<[T]> in
            let json = data as AnyObject
            guard let objects = Mapper<T>().mapArray(JSONObject: json) else {
                throw self.getError(json: json)
            }

            return Observable.just(objects)
        }
    }

    private func getError(json _: AnyObject) -> Error {
        return NSError(
            domain: "",
            code: -1,
            userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"]
        )
    }
}

public extension String {
    func mapObject<T: Mappable>(type _: T.Type) -> T? {
        return Mapper<T>().map(JSONString: self)
    }

    func mapArray<T: Mappable>(type _: T.Type) -> [T]? {
        return Mapper<T>().mapArray(JSONString: self)
    }
}
