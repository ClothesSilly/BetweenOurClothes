//
//  CategoryViewModel.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/09.
//

import RxSwift
import RxCocoa

struct CategoryViewModel {
    let disposeBag = DisposeBag()
    
    //ViewModel -> View
    let cellData: Driver<[Category]>
    // 항목을 누르면 그 항목으로 선택되고 viewController가 pop되게 설계
    let pop: Signal<Void>
    
    //View -> VIewModel
    //테이블뷰에서 어떤 row를 선택했는지 넘겨줌
    let itemSelected = PublishRelay<Int>()
    
    //VIewmodel -> 바깥(parentViewModel)
    let selectedCategory = PublishSubject<Category>()
    
    init() {
        let categories = [
            Category(id: 1, name: "카테고리(브랜드/보세)"),
            Category(id: 2, name: "성별"),
            Category(id: 3, name: "상/하의"),
            Category(id: 4, name: "사이즈/상의"),
            Category(id: 5, name: "사이즈/하의"),
            Category(id: 6, name: "색상"),
            Category(id: 7, name: "태그 유무"),
            Category(id: 8, name: "상태 점수"),
            Category(id: 9, name: "착용 횟수"),
            Category(id: 10, name: "구매시기"),
            Category(id: 11, name: "거래방식"),
            Category(id: 12, name: "판매자 신장"),
            Category(id: 13, name: "판매자 몸무게"),
            Category(id: 14, name: "판매자 사이즈"),
            Category(id: 15, name: "옷 기장")
        ]
        
        self.cellData = Driver.just(categories)
        
        //인덱스 번호로 Category 인스턴스를 넘겨줌 
        self.itemSelected
            .map{ categories[$0] }
            .bind(to: selectedCategory)
            .disposed(by: disposeBag)
        
        self.pop = itemSelected
            .map{ _ in Void() }
            .asSignal(onErrorSignalWith: .empty())
    }
}
