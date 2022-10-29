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
    
    let searchButton = UIButton()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: SearchBarViewModel){
        self.rx.text
            .bind(to: viewModel.queryText)
            .disposed(by: disposeBag)
        
        //두가지 버튼 무엇이든 검색 실행
        Observable
            .merge(
                self.rx.searchButtonClicked.asObservable(),
                searchButton.rx.tap.asObservable()
            )
            .bind(to: viewModel.searchButtonTapped)
            .disposed(by: disposeBag)
        
        viewModel.searchButtonTapped
            .asSignal()
            .emit(to: self.rx.endEditing)
            .disposed(by: disposeBag)
        
        

    }
    
    private func attribute() {
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.systemBlue, for: .normal)
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

extension Reactive where Base: SearchBar {
    var endEditing: Binder<Void> {
        return Binder(base) { base, _ in
            base.endEditing(true)
        }
    }
}
