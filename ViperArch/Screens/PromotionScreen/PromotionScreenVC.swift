//
//  PromotionScreenVC.swift
//  ViperArch
//
//  Created by Mehdok on 11/24/20.
//

import UIKit

class PromotionScreenVC: UIViewController, StoryboardInitializable {
    static func instance() -> PromotionScreenVC {
        return initFromStoryboard(name: "PromotionScreenSB")
    }
}
