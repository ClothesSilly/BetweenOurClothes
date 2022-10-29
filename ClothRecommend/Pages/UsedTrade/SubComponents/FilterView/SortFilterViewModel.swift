//
//  FilterViewModel.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//



import RxSwift
import RxCocoa

struct SortFilterViewModel {
    //FilterView 외부에서 관찰
    let sortButtonTapped = PublishRelay<Void>()
    
    
}

