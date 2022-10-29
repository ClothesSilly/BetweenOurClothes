//
//  RegisterServiceView.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/20.
//

import UIKit
import SnapKit

final class RegisterServiceView: UIView {
    
    let personalImage = UIButton()
    let nicknameTextField = UITextField()
    let nicknameHelerLabel = UILabel()
    let nicknameDuplicateCheckButton = UIButton()
    
    let finishButton = UIButton()
    
    
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
    
    private func setUp() {
        self.addSubview(personalImage)
        self.addSubview(nicknameTextField)
        self.addSubview(nicknameHelerLabel)
        self.addSubview(nicknameDuplicateCheckButton)
        self.addSubview(finishButton)
        backgroundColor = .white
        
        nicknameTextField.placeholder = "닉네임을 입력해주세요"
        personalImage.setBackgroundImage(UIImage(named: "dog"), for: .normal)
        personalImage.imageView?.contentMode = .scaleAspectFill
        
        finishButton.backgroundColor = .green
        finishButton.setTitle("완료", for: .normal)
    }
    
    private func setUpConstraints() {
        
        personalImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(60)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(personalImage.snp.width)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(personalImage.snp.bottom).offset(40)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(45)
        }
        
        finishButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
    
    
    func makeImageViewCircular() {
        personalImage.layer.cornerRadius = personalImage.frame.width / 2
        personalImage.clipsToBounds = true
    }
    
    
}
