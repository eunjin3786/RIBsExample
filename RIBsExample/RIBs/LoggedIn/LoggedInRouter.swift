//
//  LoggedInRouter.swift
//  RIBsExample
//
//  Created by Jinny on 2020/01/20.
//  Copyright © 2020 eunjin. All rights reserved.
//

import RIBs

protocol LoggedInInteractable: Interactable, StartGameListener, GameListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    
    private let startGameBuilder: StartGameBuildable
    private var startGameRouter: StartGameRouting?
    
    private let gameBuilder: GameBuildable
    private var gameRouter: GameRouting?
    
    init(interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable,
         startGameBuilder: StartGameBuildable,
         gameBuilder: GameBuildable) {
        self.viewController = viewController
        self.startGameBuilder = startGameBuilder
        self.gameBuilder = gameBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }
    
    override func didLoad() {
        routeToStartGameRIB()
    }
    
    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }
    
    func routeToStartGameRIB() {
        let startGameRouter = startGameBuilder.build(withListener: interactor)
        attachChild(startGameRouter)
        self.startGameRouter = startGameRouter
        viewController.present(viewController: startGameRouter.viewControllable)
    }
    
    func routeToGameRIB() {
        if let child = startGameRouter {
            detachChild(child)
            self.startGameRouter = nil
            viewController.dismiss(viewController: child.viewControllable)
        }
        
        let gameRouter = gameBuilder.build(withListener: interactor)
        attachChild(gameRouter)
        self.gameRouter = gameRouter
        viewController.present(viewController: gameRouter.viewControllable)
    }

    // MARK: - Private

    private let viewController: LoggedInViewControllable
}
