//
//  AppRouter.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import RxSwift

class AppRouter: BaseRouter<Void> {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> Observable<Void> {
        let rootNavigation = BaseNavigationController()

        window.rootViewController = rootNavigation
        window.makeKeyAndVisible()

        return showMainScreen(on: rootNavigation)
    }
}

private extension AppRouter {
    func showMainScreen(on rootNavigation: BaseNavigationController)
        -> Observable<Void>
    {
        rootNavigation.style = .default
        let mainRT = MainScreenRT(navigationController: rootNavigation)
        return route(to: mainRT)
    }
}
