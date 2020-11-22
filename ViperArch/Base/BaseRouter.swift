//
//  BaseRouter.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import RxSwift

/// Base abstract router generic over the return type of the `start` method.
open class BaseRouter<ResultType> {
    /// Typealias which will allows to access a ResultType of the Router by `RouterName.RouterResult`.
    public typealias RouterResult = ResultType

    /// Utility `DisposeBag` used by the subclasses.
    public var bag = DisposeBag()

    /// Unique identifier.
    private let identifier = UUID()

    /// Dictionary of the child routers. Every child router should be added
    /// to that dictionary in order to keep it in memory.
    /// Key is an `identifier` of the child router and value is the rouer itself.
    /// Value type is `Any` because Swift doesn't allow to store generic types in the array.
    private var childRouters = [UUID: Any]()

    /// Stores router to the `childRouters` dictionary.
    ///
    /// - Parameter router: Child router to store.
    private func store<T>(router: BaseRouter<T>) {
        childRouters[router.identifier] = router
    }

    /// Release router from the `childRouters` dictionary.
    ///
    /// - Parameter router: Router to release.
    private func free<T>(router: BaseRouter<T>) {
        print("free: \(router)")
        childRouters[router.identifier] = nil
    }

    /// Just a placeholder
    public init() {}

    public func disposeOnPopByGusture(_ observable: Observable<Void?>) {
        observable.subscribe { [weak self] _ in
            print("disposeOnPopByGusture: \(String(describing: self))")
            guard let `self` = self else { return }
            self.free(router: self)
        }.disposed(by: bag)
    }

    deinit {
        bag = DisposeBag()
    }

    /// 1. Stores router in a dictionary of child routers.
    /// 2. Calls method `start()` on that router.
    /// 3. On the `onNext:` of returning observable of method `start()` removes router from the dictionary.
    ///
    /// - Parameter router: Router to start.
    /// - Returns: Result of `start()` method.
    open func route<T>(to router: BaseRouter<T>)
        -> Observable<T>
    {
        store(router: router)
        return router.start()
            .do(onNext: { [weak self] _ in
                self?.free(router: router)
            })
    }

    /// Starts job of the router.
    ///
    /// - Returns: Result of router job.
    open func start() -> Observable<ResultType> {
        fatalError("Start method should be implemented.")
    }
}
