//
//  MainScreenRT.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import RxSwift

class MainScreenRT: BaseRouter<Void> {
    let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() -> Observable<Void> {
        let viewController = MainScreenVC.instance()
        let presenter = MainScreenPR(interactor: MainScreenIN())
        viewController.presenter = presenter
        navigationController.viewControllers = [viewController]
        
        return Observable.never()
    }
}
