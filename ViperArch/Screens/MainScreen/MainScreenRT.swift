//
//  MainScreenRT.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import DomainLayer
import NetworkLayer
import RxSwift

class MainScreenRT: BaseRouter<Void> {
    let navigationController: UINavigationController

    @Inject private var uiModule: UIModuleType

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() -> Observable<Void> {
        let viewController = MainScreenVC.instance()
        viewController.presenter = uiModule.component()
        navigationController.viewControllers = [viewController]

        return Observable.never()
    }
}
