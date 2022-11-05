//
//  HomeViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/06.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    // ------------------------------ UI Components ------------------------------ //
    
    
    // ------------------------------ UI Components ------------------------------ //
    
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    // TabBarController에서 AlertController가 표현되지 않는다면 다른 ViewController로 옮겨줘야함
    // 버튼이 tap되었고, 새 글 작성, 옷장에 옷걸기 중 어떤것이 선택되었는지 그 정보를 함께 받아옴
    let alertActionTapped = PublishRelay<AlertAction>()
    
    let centerButtonTapped = PublishRelay<Void>()
    
    // ------------------------------ Rx Traits ------------------------------ //
    
   
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
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
        view.backgroundColor = .systemMint
    }
    
    private func layout(){
        
    }
    
    
    
    
}
