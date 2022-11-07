//
//  SelectPostCategoryView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/07.
//

import UIKit
import RxSwift
import RxCocoa

class SelectPostCategoryView: UIScrollView {
    
    // ------------------------------ UI Components ------------------------------ //
    let stackView = UIStackView()
    
    let pcButton1 = UIButton()
    let pcButton2 = UIButton()
    let pcButton3 = UIButton()
    let pcButton4 = UIButton()
    let pcButton5 = UIButton()
    let pcButton6 = UIButton()
    let pcButton7 = UIButton()
    let pcButton8 = UIButton()
    let pcButton9 = UIButton()
    
    
    
    // ------------------------------ UI Components ------------------------------ //
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isScrollEnabled = true
        
        bind()
        attribute()
        layout()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func bind(){
        
    }
    
    private func attribute(){
        //가로 스크롤
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stackView.spacing = 8
        //버튼들의 모양이 모두 같으므로 동시에 처리
        //임시 텍스트를 지정해주기 위해 enumerate로 해줌
        [pcButton1, pcButton2, pcButton3, pcButton4, pcButton5, pcButton6, pcButton7, pcButton8, pcButton9].enumerated().forEach{ idx, btn in
            btn.layer.borderColor = CGColor(red: 255.0, green: 155.0, blue: 100.0, alpha: 1.0)
            btn.layer.cornerRadius = 10.0
            btn.setTitle("카테" + String(idx + 1), for: .normal)
            btn.setBackgroundColor(.lightGray, for: .normal)
            btn.setBackgroundColor(.orange, for: .selected)
            btn.isEnabled = true
            btn.clipsToBounds = true
            
        }
        pcButton1.addTarget(self, action: #selector(temp), for: .touchUpInside)
     
            
    }
    
    @objc func temp(){
        print("clicked")
    }
    
    private func layout(){
        
        [pcButton1, pcButton2, pcButton3, pcButton4, pcButton5, pcButton6, pcButton7, pcButton8, pcButton9].forEach{
            stackView.addSubview($0)
        }
        
        pcButton1.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(14)
            $0.width.equalTo(50)
            $0.height.equalTo(26)
        }
        
        pcButton2.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(pcButton1.snp.trailing).offset(10)
            $0.width.equalTo(50)
            $0.height.equalTo(26)
            
        }
        
        pcButton3.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(pcButton2.snp.trailing).offset(10)
            $0.width.equalTo(50)
            $0.height.equalTo(26)
        }
        
        pcButton4.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(pcButton3.snp.trailing).offset(10)
            $0.width.equalTo(50)
            $0.height.equalTo(26)
        }
        
        pcButton5.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(pcButton4.snp.trailing).offset(10)
            $0.width.equalTo(50)
            $0.height.equalTo(26)
        }
        
        pcButton6.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(pcButton5.snp.trailing).offset(10)
            $0.width.equalTo(50)
            $0.height.equalTo(26)
        }
        pcButton7.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(pcButton6.snp.trailing).offset(10)
            $0.width.equalTo(50)
            $0.height.equalTo(26)
        }
        pcButton8.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(pcButton7.snp.trailing).offset(10)
            $0.width.equalTo(50)
            $0.height.equalTo(26)
        }
        pcButton9.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(pcButton8.snp.trailing).offset(10)
            $0.width.equalTo(50)
            $0.height.equalTo(26)
        }
        
        self.addSubview(stackView)
        
    }
    
    
}
