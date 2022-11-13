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
        bindRx2()
        addTargets()
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



// 지워도 되나?
extension RegisterViewController {
    private func bindRx() {
        
        registerView.emailTextField.rx.text.orEmpty.bind(
            to: registerViewModel.emailAddress
        ).disposed(by: disposeBag)
        
        
        registerView.passwordTextField.rx.text.orEmpty.bind(to: registerViewModel.password).disposed(by: disposeBag)
        
        registerView.nameTextField.rx.text.orEmpty.bind(to: registerViewModel.name).disposed(by: disposeBag)
        
        registerView.phoneNumberTextField.rx.text.orEmpty.bind(to: registerViewModel.phoneNumber).disposed(by: disposeBag)
        
        
    }
    
    private func bindRx2() {
        registerView.nextButton.rx.tap.bind {
            
            guard let email = self.registerView.emailTextField.text, let password = self.registerView.passwordTextField.text, let name = self.registerView.nameTextField.text, let phone = self.registerView.phoneNumberTextField.text else {
                    return
            }
            
            
            
    
            UserDefaults.standard.setValue(email, forKey: "email")
            UserDefaults.standard.setValue(password, forKey: "password")
            UserDefaults.standard.setValue(name, forKey: "name")
            UserDefaults.standard.setValue(phone, forKey: "phone")

            let vc = RegisterServiceViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }.disposed(by: disposeBag)
        
        
        // email 코드 받기 부분
        registerView.getCodeButton.rx.tap.bind {
            print("SDf")
            guard let email = self.registerView.emailTextField.text else { return }
            LoginApiService.getEmailCode(email: email) { code in
                print(code)
            }
        }.disposed(by: disposeBag)
        
        
        
        
        // email 인증 부분
        registerView.verifyButton.rx.tap.bind {
            guard let email = self.registerView.emailTextField.text else { return }
            guard let code = self.registerView.emailVerifyTextField.text else { return}
            LoginApiService.verifyEmailCode(code: code, email: email) { ss in
                print(ss)
            }
            
        }.disposed(by: disposeBag)
    
    }
}
