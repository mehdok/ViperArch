//
//  MainScreenVC.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import UIKit

class MainScreenVC: BaseViewController<MainScreenIN, MainScreenPR> {
    
    static func instance() -> MainScreenVC {
        MainScreenVC.initFromStoryboard(name: "MainScreenSB")
    }
    
    override func bindViews() {
        
    }
}
