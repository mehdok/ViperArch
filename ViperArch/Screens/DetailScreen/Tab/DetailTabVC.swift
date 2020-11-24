//
//  DetailTabVC.swift
//  ViperArch
//
//  Created by Mehdok on 11/23/20.
//

import UIKit
import XLPagerTabStrip
import RxSwift
import RxCocoa
import DomainLayer

class DetailTabVC: UIViewController, StoryboardInitializable {
    private var tabTitle: String!
    private var bag = DisposeBag()
    
    let categoryPublisher = BehaviorSubject<FoodCategory?>(value: nil)
    
    static func instance(tabTitle: String) -> DetailTabVC {
        let vc = initFromStoryboard(name: "DetailTabSB")
        vc.tabTitle = tabTitle
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryPublisher.subscribe { category in
            print("title: \(String(describing: category.element??.name)) - count: \(String(describing: category.element??.menuItems?.count))")
        }.disposed(by: bag)
    }
    
    deinit {
        bag = DisposeBag()
    }
}

extension DetailTabVC: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: tabTitle)
    }
}
