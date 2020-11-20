//
//  BaseViewController.swift
//  ViperArch
//
//  Created by Mehdok on 11/20/20.
//

import UIKit
import RxSwift

open class BaseViewController<Interactor: BaseInteractor, Presenter: BasePresenter<Interactor>>: UIViewController, StoryboardInitializable {
    public var presenter: Presenter!
    public var bag = DisposeBag()
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        bindViews()
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        // sometimes user dismiss viewcontroller by gusture and thus the coordinator will not getting free
        // so we need another mech to freeup coordinator
        if isMovingFromParent {
            presenter.poppedFromNavigationStack.onNext(())
        }
    }
    
    /**
     Bind any view to model view observer like:
     ````
     (cancelBtn.rx.tap).bind(to: presenter.cancel).disposed(by: bag)
     ````
     */
    open func bindViews() {
        preconditionFailure("This method must be overrited by child class")
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /// Remove the view controller form navigation stack by delay
    ///
    /// - Parameter withDelay: delay to remove
    open func removeFormNavigationStack(withDelay _: DispatchTime = DispatchTime
        .now() + 1.5)
    {
        DispatchQueue.main
            .asyncAfter(deadline: DispatchTime.now() + 1.5) { [weak self] in
                guard let `self` = self else { return }

                guard let index = self.navigationController?.viewControllers
                    .firstIndex(where: {
                        $0.restorationIdentifier == self.restorationIdentifier
                    })
                else {
                    return
                }
                self.navigationController?.viewControllers.remove(at: index)
            }
    }

    deinit {
        print("\(String(describing: restorationIdentifier))")
        presenter.poppedFromNavigationStack.onNext(())
        bag = DisposeBag()
    }
}
