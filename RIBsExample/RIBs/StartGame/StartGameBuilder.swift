//
//  StartGameBuilder.swift
//  RIBsExample
//
//  Created by Jinny on 2020/01/20.
//  Copyright © 2020 eunjin. All rights reserved.
//

import RIBs

protocol StartGameDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var player1Name: String { get }
    var player2Name: String { get }
}

final class StartGameComponent: Component<StartGameDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    fileprivate var player1Name: String {
        return dependency.player1Name
    }
    
    fileprivate var player2Name: String {
        return dependency.player2Name
    }
}

// MARK: - Builder

protocol StartGameBuildable: Buildable {
    func build(withListener listener: StartGameListener) -> StartGameRouting
}

final class StartGameBuilder: Builder<StartGameDependency>, StartGameBuildable {

    override init(dependency: StartGameDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: StartGameListener) -> StartGameRouting {
        let component = StartGameComponent(dependency: dependency)
        let viewController = StartGameViewController(player1Name: component.player1Name, player2Name: component.player2Name)
        let interactor = StartGameInteractor(presenter: viewController)
        interactor.listener = listener
        return StartGameRouter(interactor: interactor, viewController: viewController)
    }
}
