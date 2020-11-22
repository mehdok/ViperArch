//
//  BaseNavigationController.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import UIKit

open class BaseNavigationController: UINavigationController {
    public var style: UIStatusBarStyle = .lightContent

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return style
    }
}
