//
//  SearchBarViewModel.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//

import RxSwift
import RxCocoa

struct SearchBarViewModel {
    let queryText = PublishRelay<String?>()
    //SearchBar 버튼 탭 이벤트
    let searchButtonTapped = PublishRelay<Void>()
    
    //SearchBar 외부로 내보낼 이벤트
    let shouldLoadResult: Observable<String>
    
    
    
    
    init() {
        
        self.shouldLoadResult = searchButtonTapped
            .withLatestFrom(queryText) {
                $1 ?? ""
            }
            .filter{ !$0.isEmpty }
            .distinctUntilChanged()
    }
    
    
}

