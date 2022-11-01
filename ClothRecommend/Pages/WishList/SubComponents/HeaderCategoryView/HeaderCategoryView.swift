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
    // 중고 게시글 찜 목록
    let usedWishListButton = UIButton()
    // 쇼핑몰 제품 찜 목록( 한 줄에 3개 )
    let shoppingMallWishListButton = UIButton()
    // 중고, 쇼핑몰 제품 찜목록 모두 같이 보기
    let allWishListButton = UIButton()
    let bottomBorder = UIView()
    // ------------------------------ UI Components ------------------------------ //
    
    // ------------------------------ RX Traits ------------------------------ //
    
    let usedWishListTapped = PublishRelay<Void>()
    let shoppingMallWishListButtonTapped = PublishRelay<Void>()
    let allWishListButtonTapped = PublishRelay<Void>()
    
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
        //중고 찜 목록 보여주자
        usedWishListButton.rx.tap
            .bind(to: usedWishListTapped)
            .disposed(by: disposeBag)
        
        //쇼핑몰 찜 목록을 보여주자
        shoppingMallWishListButton.rx.tap
            .bind(to: shoppingMallWishListButtonTapped)
            .disposed(by: disposeBag)
        
        //모든 찜 목록을 보여주자
        allWishListButton.rx.tap
            .bind(to: allWishListButtonTapped)
            .disposed(by: disposeBag)
    }
    
    private func attribute(){
        
//        usedWishListButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        usedWishListButton.isEnabled = true
        usedWishListButton.setTitle("중고상품", for: .normal)
        usedWishListButton.setTitleColor(.black, for: .normal)
        usedWishListButton.backgroundColor = .lightGray
        //titleLabel 이 없을 수 있으니 옵셔널 처리
        usedWishListButton.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 12)
        usedWishListButton.layer.cornerRadius = 8
        usedWishListButton.addTarget(self, action: #selector(printLog(_:)), for: .touchUpInside)
        
        shoppingMallWishListButton.setTitle("쇼핑몰 상품", for: .normal)
        shoppingMallWishListButton.setTitleColor(.black, for: .normal)
        shoppingMallWishListButton.backgroundColor = .lightGray
        //titleLabel 이 없을 수 있으니 옵셔널 처리
        shoppingMallWishListButton.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 12)
        shoppingMallWishListButton.layer.cornerRadius = 8
        shoppingMallWishListButton.addTarget(self, action: #selector(printLog(_:)), for: .touchUpInside)
        
        allWishListButton.setTitle("모든 찜 상품", for: .normal)
        allWishListButton.setTitleColor(.black, for: .normal)
        allWishListButton.backgroundColor = .lightGray
        //titleLabel 이 없을 수 있으니 옵셔널 처리
        allWishListButton.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 12)
        allWishListButton.layer.cornerRadius = 8
        allWishListButton.addTarget(self, action: #selector(printLog(_:)), for: .touchUpInside)
        
        bottomBorder.backgroundColor = .lightGray
    }
    //어떤 버튼 클릭했는지 보기 위한 로그 출력 함수
    @objc func printLog(_ sender: UIButton) {
        print("button clicked! \( sender.titleLabel?.text)")
        }
    private func layout(){
        [usedWishListButton, shoppingMallWishListButton, allWishListButton]
            .forEach{
                addSubview($0)
            }
        
        usedWishListButton.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
        
        shoppingMallWishListButton.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(usedWishListButton.snp.trailing).offset(6)
        }
        
        allWishListButton.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(shoppingMallWishListButton.snp.trailing).offset(6)
        }
    }
}
