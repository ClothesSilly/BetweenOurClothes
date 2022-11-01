//
//  SearchBarViewModel.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//

import RxSwift
import RxCocoa

struct SearchBarViewModel {
//    let queryText = PublishRelay<String?>()
    
//    //SearchBar 버튼 탭 이벤트 ( 우리가 추가적으로 만들어놓은 "검색" 버튼을 눌렀을 때 이벤트 발생 )
//    //별다른 값 전달 없이 클릭했다는 사실만 전달하면 되므로 Void
//    let searchButtonTapped = PublishRelay<Void>()
//    
//    //SearchBar 외부로 내보낼 이벤트
//    // 검색창에 입력한 String을 전달해야하기 때문에
//    var shouldLoadResult = Observable<String>.of("")
    
//    init() {
//
//        self.shouldLoadResult = searchButtonTapped
//            .withLatestFrom(queryText) { // text가 없다면 빈 문자열 보냄
//                $1 ?? ""
//            }
//            .filter{ !$0.isEmpty }// 빈 값을 보내지 않도록 필터 처리
//            .distinctUntilChanged()// 동일한 text를 계속 가져오지 않도록
//    }
    
    
}

