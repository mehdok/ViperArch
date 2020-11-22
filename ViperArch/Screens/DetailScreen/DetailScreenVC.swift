//
//  DetailScreenVC.swift
//  ViperArch
//
//  Created by Mehdok on 11/22/20.
//

import UIKit

class DetailScreenVC: UIViewController, StoryboardInitializable {
    static func instance() -> DetailScreenVC {
        return initFromStoryboard(name: "DetailScreenSB")
    }
}
