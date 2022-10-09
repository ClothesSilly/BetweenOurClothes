//
//  LoginView.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/09.
//

import UIKit
import SnapKit


class LoginView: UIView {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    
    let nextButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(nextButton)
        
        backgroundColor = .white
        
        emailTextField.placeholder = "이메일을 입력해주세요"
        passwordTextField.placeholder = "비밀번호를 입력해주세요"
        passwordTextField.isSecureTextEntry = true
        
        
        nextButton.setTitle("다음으로", for: .normal)
        nextButton.backgroundColor = .green
    }
    
    private func setUpConstraints() {
        
        emailTextField.snp.makeConstraints { 
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.leading.equalTo(30)
            $0.trailing.equalTo(-30)
            $0.height.equalTo(45)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.leading.equalTo(30)
            $0.trailing.equalTo(-30)
            $0.height.equalTo(45)
        }
        
        nextButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.bottom.equalToSuperview().offset(-50)
        }
        
    }
    
}
