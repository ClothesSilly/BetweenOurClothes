//
//  SearchBar.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//


import UIKit
import RxSwift
import RxCocoa
import SnapKit

class SearchBar: UISearchBar {
    let disposeBag = DisposeBag()
    // 우측에 배치할 검색 버튼
    let searchButton = UIButton()

    ////SearchBar 버튼 탭 이벤트 ( 우리가 추가적으로 만들어놓은 "검색" 버튼을 눌렀을 때 이벤트 발생 )
    //별다른 값 전달 없이 클릭했다는 사실만 전달하면 되므로 Void
    let searchButtonTapped = PublishRelay<Void>()
    
    //SearchBar 외부로 내보낼 이벤트
    // 검색창에 입력한 String을 전달해야하기 때문에
    var shouldLoadResult = Observable<String>.of("")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .cyan
        
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // SearchBarViewModel에는 SearchButtonTapped와 shouldLoadResult가 있다.
    private func bind(){
//        self.rx.text
//            .bind(to: viewModel.queryText)
//            .disposed(by: disposeBag)
        
        //두가지 버튼 무엇이든 검색 실행
        Observable
            .merge(
                // 기본 SearchBar가 갖고있는 이벤트 ( 키보드 상에서의 검색(엔터) 버튼 )
                self.rx.searchButtonClicked.asObservable(),
                // 추가적으로 만들어준 searchButton의 tap이벤트를 묶어줌
                searchButton.rx.tap.asObservable()
            )//viewModel로 넘겨줌 ( 이곳은 View이기 때문에 그 이상의 logic은 viewModel로 넘긴다
            .bind(to: searchButtonTapped)
            .disposed(by: disposeBag)
        
        //검색 버튼을 누르면 키보드를 내려주기 위해
        searchButtonTapped
            .asSignal()
            .emit(to: self.rx.endEditing)
            .disposed(by: disposeBag)
        
        self.shouldLoadResult = searchButtonTapped
            .withLatestFrom(self.rx.text) { // text가 없다면 빈 문자열 보냄
                $1 ?? ""
            }
            .filter{ !$0.isEmpty }// 빈 값을 보내지 않도록 필터 처리
            .distinctUntilChanged()// 동일한 text를 계속 가져오지 않도록
    }
    
    private func attribute() {
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.systemCyan, for: .normal)
    }
    
    private func layout() {
        addSubview(searchButton)
        
        searchTextField.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalTo(searchButton.snp.leading).offset(-12)
            $0.centerY.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
    }
    
}
//SearchBar의 확장형
extension Reactive where Base: SearchBar {
    var endEditing: Binder<Void> {
        return Binder(base) { base, _ in
            //rx가 아니라 기본 searchBar가 가지고있는 endEditing
            base.endEditing(true)
        }
    }
}
