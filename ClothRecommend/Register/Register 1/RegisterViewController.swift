//
//  RegisterViewController.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/19.
//

import UIKit
import RxSwift
import RxCocoa

final class RegisterViewController: UIViewController {
    
    let registerView = RegisterView()
    let registerViewModel = RegisterViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "정보 입력"
        
        registerView.nextButton.rx.tap.bind {
            let vc = RegisterServiceViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }.disposed(by: disposeBag)
    
        addTargets()
//        bindRx()
    }
    
    private func addTargets() {
        registerView.passwordCheckTextField.addTarget(self, action: #selector(checkPasswordMatch), for: .editingChanged)
    }
    
    @objc func checkPasswordMatch( _ textField: UITextField) {
        if let currentPassword = textField.text, let writtenPasword = registerView.passwordTextField.text {
            if currentPassword == writtenPasword {
                registerView.passwordHelpLabel.text = "비밀번호가 동일합니다."
            } else {
                registerView.passwordHelpLabel.text = "비밀번호를 확인해주세요"
            }
        }
    }

}



extension RegisterViewController {
    private func bindRx() {
        
        registerView.emailTextField.rx.text.orEmpty.bind(
            to: registerViewModel.emailAddress
        ).disposed(by: disposeBag)
        
        
        registerView.passwordTextField.rx.text.orEmpty.bind(to: registerViewModel.password).disposed(by: disposeBag)
        
        registerView.nameTextField.rx.text.orEmpty.bind(to: registerViewModel.name).disposed(by: disposeBag)
        
        registerView.phoneNumberTextField.rx.text.orEmpty.bind(to: registerViewModel.phoneNumber).disposed(by: disposeBag)
        
        
    }
}
