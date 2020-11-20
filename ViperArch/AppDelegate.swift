//
//  AppDelegate.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import RxSwift
import UIKit

@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {
    override func services() -> [ApplicationService] {
        [
            DependenciesApplicationService(),
            UIApplicationService(window: window),
        ]
    }
}
