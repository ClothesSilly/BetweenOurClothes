//
//  PostDetailViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/07.
//

import UIKit
import RxSwift
import RxCocoa

class PostDetailViewController: UIViewController {
    
    // ------------------------------ UI Components ------------------------------ //
    
    
    
    
    // ------------------------------ UI Components ------------------------------ //
    
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    
    //
    let postCellData = PublishSubject<SearchResultCellData>()
    
    
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
        view.backgroundColor = .magenta
    }
    
    private func layout(){
        
    }
}
