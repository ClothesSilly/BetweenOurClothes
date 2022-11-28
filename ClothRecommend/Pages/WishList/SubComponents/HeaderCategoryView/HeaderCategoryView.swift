//
//  HeaderCategoryView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/01.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit


//FilterView 버튼이 눌렸을 때, 다른 View인 테이블뷰가 원소 나열을 다시 해야하므로, event를 밖으로 던져줘야 할 것이다.
// 이를 생각하고 Rx traits를 구성해야한다.
class HeaderCategoryView: UIView {
    let disposeBag = DisposeBag()
    
    // ------------------------------ UI Components ------------------------------ //

    let titleLabel = UILabel()
    let bottomBorder = UIView()
    // ------------------------------ UI Components ------------------------------ //
    
    // ------------------------------ RX Traits ------------------------------ //
    
//    let usedWishListTapped = PublishRelay<Void>()
//    let shoppingMallWishListButtonTapped = PublishRelay<Void>()
//    let allWishListButtonTapped = PublishRelay<Void>()
    
    // ------------------------------ RX Traits ------------------------------ //

  

    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.textColor = UIColor(red: 226/255.0, green: 136/255.0, blue: 122/255.0, alpha: 1.0)
//        UIColor(red: 216/255.0, green: 106/255.0, blue: 162/255.0, alpha: 1.0)
        
        titleLabel.text = "나의 찜 목록"
        
        bottomBorder.backgroundColor = UIColor(red: 176/255.0, green: 96/255.0, blue: 132/255.0, alpha: 1.0)
    }
    
    private func layout(){
        [titleLabel, bottomBorder]
            .forEach{
                self.addSubview($0)
//                addSubview($0)
            }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalTo(bottomBorder.snp.top).offset(-6)
//            $0.height.equalTo(20)
//            $0.width.equalTo(100)
        }
        
        bottomBorder.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(3.0)
        }
    }
}
