//
//  StartGameRouter.swift
//  RIBsExample
//
//  Created by Jinny on 2020/01/20.
//  Copyright © 2020 eunjin. All rights reserved.
//

import RIBs

protocol StartGameInteractable: Interactable {
    var router: StartGameRouting? { get set }
    var listener: StartGameListener? { get set }
}

protocol StartGameViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class StartGameRouter: ViewableRouter<StartGameInteractable, StartGameViewControllable>, StartGameRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: StartGameInteractable, viewController: StartGameViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
