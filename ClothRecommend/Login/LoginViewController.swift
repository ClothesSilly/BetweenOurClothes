//
//  LoginViewController.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/09.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "로그인"
        
        
        
        loginView.nextButton.rx.tap.bind {
            let vc = MainTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }.disposed(by: disposeBag)
        
    }
    
}
