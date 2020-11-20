//
//  UIApplicationService.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import RxSwift
import UIKit

class UIApplicationService: ApplicationService {
    var window: UIWindow?
    // TODO: dispose bag when app is terminated
    private let disposeBag = DisposeBag()
    private var appRouter: AppRouter!

    init(window: UIWindow?) {
        self.window = window
    }

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        startFirstPage()
        return true
    }
}

extension UIApplicationService {
    func startFirstPage() {
        window = UIWindow(frame: UIScreen.main.bounds)
        appRouter = AppRouter(window: window!)
        appRouter.start()
            .subscribe()
            .disposed(by: disposeBag)
    }
}
