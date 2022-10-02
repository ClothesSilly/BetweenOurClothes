//
//  RegisterView.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/19.
//

import UIKit

final class RegisterView: UIView {
    
    let emailTextField = UITextField()
    let getCodeButton = UIButton()
    
    let emailVerifyTextField = UITextField()
    let verifyButton = UIButton()
    
    let emailDivider = UIView()
    
    
    let passwordTextField = UITextField()
    let passwordCheckTextField = UITextField()
    
    let passwordHelpLabel = UILabel()
    
    let passwordDivider = UIView()
    
    let nameTextField = UITextField()
    let phoneNumberTextField = UITextField()
    
    let nextButton = UIButton()
    
    private func setUp() {
        self.addSubview(emailTextField)
        self.addSubview(getCodeButton)
        self.addSubview(emailVerifyTextField)
        self.addSubview(verifyButton)
        
        self.addSubview(emailDivider)
        
        self.addSubview(passwordTextField)
        self.addSubview(passwordCheckTextField)
        self.addSubview(passwordHelpLabel)
        self.addSubview(passwordDivider)
        
        self.addSubview(nameTextField)
        self.addSubview(phoneNumberTextField)
        self.addSubview(nextButton)
        
        backgroundColor = .white
        
        emailTextField.placeholder = "이메일을 입력해주세요"
        emailVerifyTextField.placeholder = "인증 번호를 입력해주세요"
        
        getCodeButton.setTitle("인증", for: .normal)
        getCodeButton.backgroundColor = .green
        verifyButton.setTitle("인증하기", for: .normal)
        verifyButton.backgroundColor =  .green
        
        emailDivider.backgroundColor = .lightGray
        passwordDivider.backgroundColor = .lightGray
        
        
        passwordTextField.placeholder = "비밀번호를 입력해주세요"
        passwordTextField.isSecureTextEntry = true
        passwordCheckTextField.placeholder = "비밀번호 확인"
        passwordCheckTextField.isSecureTextEntry = true
        passwordHelpLabel.text = "비밀번호가 맞습니다"
        passwordHelpLabel.font = .systemFont(ofSize: 13)
        nameTextField.placeholder = "이름을 입력해주세요"
        phoneNumberTextField.placeholder = "번호를 입력해주세요"
        
        nextButton.setTitle("다음으로", for: .normal)
        nextButton.backgroundColor = .green
        
    }
    
    private func setUpConstraints() {
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(45)
        }
        
        
        getCodeButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(45)
        }
        
        
        emailVerifyTextField.snp.makeConstraints { make in
            make.top.equalTo(getCodeButton.snp.bottom).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(45)
        }
        
        
        verifyButton.snp.makeConstraints { make in
            make.top.equalTo(emailVerifyTextField.snp.bottom).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(45)
        }
        
        emailDivider.snp.makeConstraints { make in
            make.top.equalTo(verifyButton.snp.bottom).offset(15)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(1)
        }
        
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailDivider.snp.bottom).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(45)
        }
        
        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(45)
        }
        
        passwordHelpLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckTextField.snp.bottom).offset(3)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(10)
        }
        
        passwordDivider.snp.makeConstraints { make in
            make.top.equalTo(passwordHelpLabel.snp.bottom).offset(15)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(1)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordDivider.snp.bottom).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(45)
        }
        
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(45)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        setUpConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
}
