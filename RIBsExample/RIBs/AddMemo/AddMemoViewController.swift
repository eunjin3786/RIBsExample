//
//  AddMemoViewController.swift
//  RIBsExample
//
//  Created by Jinny on 2020/01/20.
//  Copyright © 2020 eunjin. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol AddMemoPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AddMemoViewController: UIViewController, AddMemoPresentable, AddMemoViewControllable {
    
    @IBOutlet weak var nickNameLabel: UILabel!
    

    weak var listener: AddMemoPresentableListener?
    
    private let nickName: String
    init(nickName: String) {
        self.nickName = nickName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nickNameLabel.text = "\(nickName)님 메모를 추가하세요"
    }
}
