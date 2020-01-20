//
//  RootRouter.swift
//  RIBsExample
//
//  Created by Jinny on 2020/01/20.
//  Copyright © 2020 eunjin. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener, LoggedInListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let loggedOutBuilder: LoggedOutBuildable
    private var loggedOutRouter: LoggedOutRouting?
    
    private let loggedInBuilder: LoggedInBuildable
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loggedOutBuilder: LoggedOutBuildable,
         loggedInBuilder: LoggedInBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        routeToLoggedOutRIB()
    }
    
    func routeToLoggedOutRIB() {
        let loggedOutRouter = loggedOutBuilder.build(withListener: interactor)
        self.loggedOutRouter = loggedOutRouter
        attachChild(loggedOutRouter)
        viewController.present(viewController: loggedOutRouter.viewControllable)
    }
    
    func routeToLoggedInRIB() {
        if let child = loggedOutRouter {
            detachChild(child)
            self.loggedOutRouter = nil
            viewController.dismiss(viewController: child.viewControllable)
        }
        
        let loggedInRouter = loggedInBuilder.build(withListener: interactor)
        attachChild(loggedInRouter)
    }
}
