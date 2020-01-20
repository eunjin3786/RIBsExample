//
//  LoggedOutViewController.swift
//  RIBsExample
//
//  Created by Jinny on 2020/01/20.
//  Copyright © 2020 eunjin. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit

protocol LoggedOutPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func login()
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {
    
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    weak var listener: LoggedOutPresentableListener?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.listener?.login()
        }).disposed(by: disposeBag)
    }
}
