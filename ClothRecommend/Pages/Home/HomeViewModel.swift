//
//  HomeViewModel.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/15.
//

import Foundation
import RxSwift
import RxCocoa
import simd

struct HomeViewModel {
    
    //ViewModel -> View
    let cellData: Driver<[String]>
    
    //각 항목의 제목으로 넘겨줄 Observable들
    let title1 = Observable.just("배너")
    let title2 = Observable.just("새로 올라온 물품")
    let title3 = Observable.just("추천 상품")
    let title4 = Observable.just("오늘의 추천 코디")
    
    init(){
        self.cellData = Observable
            .combineLatest(title1, title2, title3, title4){
                [$0, $1, $2, $3]
            }
            .asDriver(onErrorJustReturn: [])
        
    }
    
    
  
}
