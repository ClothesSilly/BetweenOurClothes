//
//  DetailWriteFormCellViewModel.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/10.
//

import RxSwift
import RxCocoa


struct DetailWriteFormCellViewModel {
    //View -> ViewModel
    let contentValue = PublishRelay<String?>()
    
}
