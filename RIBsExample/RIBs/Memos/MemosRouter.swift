//
//  MemosRouter.swift
//  RIBsExample
//
//  Created by Jinny on 2020/01/20.
//  Copyright © 2020 eunjin. All rights reserved.
//

import RIBs

protocol MemosInteractable: Interactable, AddMemoListener {
    var router: MemosRouting? { get set }
    var listener: MemosListener? { get set }
}

protocol MemosViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
}

final class MemosRouter: ViewableRouter<MemosInteractable, MemosViewControllable>, MemosRouting {

    private let addMemoBuilder: AddMemoBuildable
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: MemosInteractable,
                  viewController: MemosViewControllable,
                  addMemoBuilder: AddMemoBuildable) {
        self.addMemoBuilder = addMemoBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToAddMemoRIB() {
        let addMemoRouter = addMemoBuilder.build(withListener: interactor)
        attachChild(addMemoRouter)
        viewController.present(viewController: addMemoRouter.viewControllable)
    }
}
