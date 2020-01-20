//
//  GameRouter.swift
//  RIBsExample
//
//  Created by Jinny on 2020/01/20.
//  Copyright © 2020 eunjin. All rights reserved.
//

import RIBs

protocol GameInteractable: Interactable {
    var router: GameRouting? { get set }
    var listener: GameListener? { get set }
}

protocol GameViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class GameRouter: ViewableRouter<GameInteractable, GameViewControllable>, GameRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: GameInteractable, viewController: GameViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
