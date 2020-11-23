//
//  DetailScreenVC.swift
//  ViperArch
//
//  Created by Mehdok on 11/22/20.
//

import DomainLayer
import RxCocoa
import RxSwift
import UIKit
import XLPagerTabStrip

class DetailScreenVC: ButtonBarPagerTabStripViewController, StoryboardInitializable {
    public var bag = DisposeBag()

    var foodData: Driver<[FoodCategory]>? {
        didSet {
            bindData()
        }
    }

    static func instance() -> DetailScreenVC {
        return initFromStoryboard(name: "DetailScreenSB")
    }

    override func viewDidLoad() {
        setupTabStrip()
        super.viewDidLoad()
    }

    private func bindData() {
        foodData?.asObservable().subscribe { _ in
            print("data received")
        }.disposed(by: bag)
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        [DetailTabVC.instance(tabTitle: "Appeteasers"),
         DetailTabVC.instance(tabTitle: "Salads"),
         DetailTabVC.instance(tabTitle: "Burgers")]
    }

    deinit {
        print("\(String(describing: restorationIdentifier))")
        bag = DisposeBag()
    }
}

extension DetailScreenVC {
    private func setupTabStrip() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemFont = .systemFont(ofSize: 20, weight: .bold)
        settings.style.selectedBarHeight = 2
    }
}
