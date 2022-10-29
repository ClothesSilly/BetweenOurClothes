//
//  WelcomeView.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/19.
//

import UIKit
import SnapKit

final class WelcomeView: UIView {
    
    let logo = UIImageView()
    
    
    let welcommingLabel = UILabel()
    let welcommingDiscriptionLabel = UILabel()
    
    let startButton = UIButton()
    let registerButton = UIButton()
    
    
    private func setUp() {
        self.addSubview(logo)
        self.addSubview(welcommingLabel)
        self.addSubview(welcommingDiscriptionLabel)
        self.addSubview(startButton)
        self.addSubview(registerButton)
        
        
        backgroundColor = .white
        
        
        welcommingLabel.text = "패션의 관심이 있는 당신!!"
        welcommingLabel.textAlignment = .center
        welcommingLabel.font = .systemFont(ofSize: 30)
        welcommingDiscriptionLabel.text = "내옷네옷을 통해 패션 지식을 채우세요~"
        welcommingDiscriptionLabel.textAlignment = .center
        
        
        logo.image = UIImage(named: "dog")
        startButton.backgroundColor = .green
        startButton.layer.cornerRadius = 15
        startButton.setTitle("시작하기", for: .normal)
        
        registerButton.backgroundColor = .blue
        registerButton.layer.cornerRadius = 15
        registerButton.setTitle("회원가입", for: .normal)
    }
    
    private func setUpConstraints() {
        
        logo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(logo.snp.width)
        }
        
        welcommingLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(30)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(30)
        }
        
        welcommingDiscriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(welcommingLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        
        registerButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-50)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(registerButton.snp.top).offset(-10)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            
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

