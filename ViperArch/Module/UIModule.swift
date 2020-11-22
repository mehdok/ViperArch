//
//  UIModule.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import DomainLayer

protocol UIModuleType {
    func component() -> MainScreenPR
}

struct UIModule: UIModuleType {
    func component() -> MainScreenPR {
        MainScreenPR(interactor: component())
    }
}

extension UIModule {
    private func component() -> MainScreenIN {
        MainScreenIN()
    }
}
