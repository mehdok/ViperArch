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
import RxDataSources

class DetailTabVC: UIViewController, StoryboardInitializable {
    let kCellId = "FoodCell"

    private var tabTitle: String!
    private var bag = DisposeBag()
    let categoryPublisher = BehaviorSubject<FoodCategory?>(value: nil)

    @IBOutlet weak var tableView: UITableView!
    
    static func instance(tabTitle: String) -> DetailTabVC {
        let vc = initFromStoryboard(name: "DetailTabSB")
        vc.tabTitle = tabTitle
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindDataSource()
    }
    
    func bindDataSource() {
        // hide separator between empty cells
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: kCellId, bundle: nil),
                           forCellReuseIdentifier: kCellId)
        
        tableView.rowHeight = 120
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfFood>(
            configureCell: { [unowned self] _, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: self.kCellId, for: indexPath) as! FoodCell
                cell.food = item

                return cell
        })
        
        categoryPublisher
            .filter { $0?.menuItems != nil}
            .map { ($0!.menuItems)! }
            .map { [SectionOfFood(header:"", items: $0)] }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
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
