//
//  DetailTabVC.swift
//  ViperArch
//
//  Created by Mehdok on 11/23/20.
//

import UIKit
import XLPagerTabStrip

class DetailTabVC: UIViewController, StoryboardInitializable {
    private var tabTitle: String!
    
    static func instance(tabTitle: String) -> DetailTabVC {
        let vc = initFromStoryboard(name: "DetailTabSB")
        vc.tabTitle = tabTitle
        return vc
    }
}

extension DetailTabVC: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: tabTitle)
    }
}
