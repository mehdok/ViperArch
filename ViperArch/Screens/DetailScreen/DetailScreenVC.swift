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

    let foodPublisher = BehaviorSubject<[FoodCategory]>(value: [])
    private let appeteasersPublisher = BehaviorSubject<FoodCategory?>(value: nil)
    private let saladPublisher = BehaviorSubject<FoodCategory?>(value: nil)
    private let burgersPublisher = BehaviorSubject<FoodCategory?>(value: nil)

    static func instance() -> DetailScreenVC {
        return initFromStoryboard(name: "DetailScreenSB")
    }

    override func viewDidLoad() {
        setupTabStrip()
        bindData()

        super.viewDidLoad()
    }

    private func bindData() {
        foodPublisher
            .map { $0.first(where: { $0.name == "Appeteasers" }) }
            .filter { $0 != nil }
            .map { $0! }
            .bind(to: appeteasersPublisher)
            .disposed(by: bag)

        foodPublisher
            .map { $0.first(where: { $0.name == "Salads" }) }
            .filter { $0 != nil }
            .map { $0! }
            .bind(to: saladPublisher)
            .disposed(by: bag)

        foodPublisher
            .map { $0.first(where: { $0.name == "Burgers" }) }
            .filter { $0 != nil }
            .map { $0! }
            .bind(to: burgersPublisher)
            .disposed(by: bag)
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        [appeteasersVC,
         saladVC,
         burgersVC]
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

extension DetailScreenVC {
    private var appeteasersVC: DetailTabVC {
        let vc = DetailTabVC.instance(tabTitle: "Appeteasers")
        appeteasersPublisher
            .filter { $0 != nil }
            .map { $0! }
            .bind(to: vc.categoryPublisher)
            .disposed(by: bag)
        return vc
    }

    private var saladVC: DetailTabVC {
        let vc = DetailTabVC.instance(tabTitle: "Salads")
        saladPublisher
            .filter { $0 != nil }
            .map { $0! }
            .bind(to: vc.categoryPublisher)
            .disposed(by: bag)
        return vc
    }

    private var burgersVC: DetailTabVC {
        let vc = DetailTabVC.instance(tabTitle: "Burgers")
        burgersPublisher
            .filter { $0 != nil }
            .map { $0! }
            .bind(to: vc.categoryPublisher)
            .disposed(by: bag)
        return vc
    }
}
