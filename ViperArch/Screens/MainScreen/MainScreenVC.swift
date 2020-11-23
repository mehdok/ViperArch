//
//  MainScreenVC.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import FloatingPanel
import UIKit
import RxSwift
import RxCocoa

class MainScreenVC: BaseViewController<MainScreenIN, MainScreenPR> {
    var fpc: FloatingPanelController!
    var detailLayer: DetailScreenVC!
    
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    

    static func instance() -> MainScreenVC {
        MainScreenVC.initFromStoryboard(name: "MainScreenSB")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fpc = FloatingPanelController()
        fpc.contentMode = .fitToBounds
        detailLayer = DetailScreenVC.instance()
        fpc.set(contentViewController: detailLayer)
        fpc.delegate = self
        fpc.layout = self
        fpc.addPanel(toParent: self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

//        fpc?.removePanelFromParent(animated: animated)
    }

    override func bindViews() {
        presenter.isLoading?.drive(rx_showLoading).disposed(by: bag)
        
        presenter.hasFailed?
            .map { ($0.localizedDescription, MessageType.error) }
            .drive(rx_showMessage)
            .disposed(by: bag)

        presenter.hasSucced?.asObservable().subscribe{ categories in
            print("categories_loaded:")
        }
        .disposed(by: bag)
    }
}

extension MainScreenVC: FloatingPanelControllerDelegate {
    func floatingPanel(_: FloatingPanelController, layoutFor _: CGSize) -> FloatingPanelLayout {
        self
    }
}

extension MainScreenVC: FloatingPanelLayout {
    var initialState: FloatingPanelState {
        .half
    }

    var position: FloatingPanelPosition {
        .bottom
    }

    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        [
            .full: FloatingPanelLayoutAnchor(absoluteInset: 0, edge: .top, referenceGuide: .safeArea),
            .half: FloatingPanelLayoutAnchor(fractionalInset: 0.3, edge: .bottom, referenceGuide: .safeArea),
            .tip: FloatingPanelLayoutAnchor(fractionalInset: 0.3, edge: .bottom, referenceGuide: .safeArea),
        ]
    }
}

extension MainScreenVC {
    var rx_showLoading: AnyObserver<Bool> {
        return Binder(self, binding: { [weak self] _, show in
            self?.loadIndicator.isHidden = !show
        }).asObserver()
    }
}
