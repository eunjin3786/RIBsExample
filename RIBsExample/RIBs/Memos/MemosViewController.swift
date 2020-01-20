//
//  MemosViewController.swift
//  RIBsExample
//
//  Created by Jinny on 2020/01/20.
//  Copyright © 2020 eunjin. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol MemosPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func addMemoDidTap()
}

final class MemosViewController: UIViewController, MemosPresentable, MemosViewControllable {

    
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBAction func addMemoDidTap(_ sender: Any) {
        listener?.addMemoDidTap()
    }
    
    weak var listener: MemosPresentableListener?
    
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
        nickNameLabel.text = "\(nickName)님의 메모"
    }
    
    func present(viewController: ViewControllable) {
        self.present(viewController.uiviewController, animated: true, completion: nil)
    }
}
