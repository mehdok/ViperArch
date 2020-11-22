//
//  BasePresenter.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import RxSwift

open class BasePresenter<Interactor: BaseInteractor> {
    public let interactor: Interactor

    var poppedFromNavigationStack: AnyObserver<Void>
    public var didPoppedFromNavigationStack: Observable<Void>

    public init(interactor: Interactor) {
        self.interactor = interactor

        let _poppedFromNavigationStack = PublishSubject<Void>()
        poppedFromNavigationStack = _poppedFromNavigationStack.asObserver()
        didPoppedFromNavigationStack = _poppedFromNavigationStack.asObservable()
    }

    deinit {
        print("\(String(describing: self))")
    }
}
