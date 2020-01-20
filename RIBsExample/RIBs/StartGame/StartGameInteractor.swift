//
//  StartGameInteractor.swift
//  RIBsExample
//
//  Created by Jinny on 2020/01/20.
//  Copyright © 2020 eunjin. All rights reserved.
//

import RIBs
import RxSwift

protocol StartGameRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol StartGamePresentable: Presentable {
    var listener: StartGamePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol StartGameListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class StartGameInteractor: PresentableInteractor<StartGamePresentable>, StartGameInteractable, StartGamePresentableListener {

    weak var router: StartGameRouting?
    weak var listener: StartGameListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: StartGamePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
