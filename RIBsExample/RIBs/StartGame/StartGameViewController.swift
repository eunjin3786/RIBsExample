//
//  StartGameViewController.swift
//  RIBsExample
//
//  Created by Jinny on 2020/01/20.
//  Copyright © 2020 eunjin. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit

protocol StartGamePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func startGame()
}

final class StartGameViewController: UIViewController, StartGamePresentable, StartGameViewControllable {
    
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    weak var listener: StartGamePresentableListener?
    private let player1Name: String
    private let player2Name: String
    
    private let disposeBag = DisposeBag()
    
    init(player1Name: String,
         player2Name: String) {
        self.player1Name = player1Name
        self.player2Name = player2Name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1NameLabel.text = player1Name
        player2NameLabel.text = player2Name
        
        startButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.listener?.startGame()
        }).disposed(by: disposeBag)
    }
}
