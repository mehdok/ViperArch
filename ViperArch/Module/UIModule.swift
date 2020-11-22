//
//  UIModule.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import DomainLayer
import NetworkLayer

protocol UIModuleType {
    func component() -> MainScreenPR
}

struct UIModule: UIModuleType {
    @Inject private var networkModule: NetworkModule

    func component() -> MainScreenPR {
        MainScreenPR(interactor: component())
    }
}

extension UIModule {
    private func component() -> MainScreenIN {
        MainScreenIN(foodRepository: networkModule.component())
    }
}
