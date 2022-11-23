//
//  CategoryMainListView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//

import UIKit
import RxSwift
import RxCocoa


typealias CategoryMain = ( url: URL?, title: String)

final class CategoryMainListView: UICollectionView {
    let disposeBag = DisposeBag()
    //대분류 선택여부
    var now_selected: [Bool] = [true, false, false, false]
    
    let cmChoiceIndex = PublishRelay<Int>()
    
    let cellData = Observable.of([
        CategoryMain(nil, "상의"),
        CategoryMain(nil, "하의"),
        CategoryMain(nil, "아우터"),
        CategoryMain(nil, "원피스")
    ])
    

    override init(frame: CGRect, collectionViewLayout collecViewLayout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collecViewLayout)
        
        self.register(CategoryMainListCell.self, forCellWithReuseIdentifier: "CategoryMainListCell")
       
        bind()
        attribute()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(){
        //선택한 항목IndexPath를 넘겨줌
        let selectEvent = self.rx.itemSelected
            .map{ idx -> Int in
                let now: Int = idx.row
                self.now_selected[now] = !self.now_selected[now]
                print(self.now_selected)
                let ud = UserDefaults.standard
                print(ud.value(forKey: "userToken")!)
                return now
            }
            .bind(to: cmChoiceIndex)
            
        selectEvent.disposed(by: disposeBag)
        
        // cellData를 화면에 뿌려주는 코드
        
                           
                           
        cellData
            .bind(to: self.rx.items(
            cellIdentifier: "CategoryMainListCell",
            cellType: CategoryMainListCell.self
            )
        ){ index, data, cell in
                switch index{
                case 0:
                    cell.backgroundColor = self.now_selected[0] ? UIColor(red: 253/255.0, green: 212/255.0, blue: 160/255.0, alpha: 1.0) : UIColor(red: 253/255.0, green: 242/255.0, blue: 180/255.0, alpha: 1.0)
                case 1:
                    cell.backgroundColor = self.now_selected[1] ? UIColor(red: 253/255.0, green: 212/255.0, blue: 160/255.0, alpha: 1.0) : UIColor(red: 253/255.0, green: 242/255.0, blue: 180/255.0, alpha: 1.0)
                case 2:
                    cell.backgroundColor = self.now_selected[2] ? UIColor(red: 253/255.0, green: 212/255.0, blue: 160/255.0, alpha: 1.0) : UIColor(red: 253/255.0, green: 242/255.0, blue: 180/255.0, alpha: 1.0)
                default:
                    cell.backgroundColor = self.now_selected[3] ? UIColor(red: 253/255.0, green: 212/255.0, blue: 160/255.0, alpha: 1.0) : UIColor(red: 253/255.0, green: 242/255.0, blue: 180/255.0, alpha: 1.0)
                }
               // cell.cmImage = color.
                cell.setData(data)
            }
        
        //.disposed(by: disposeBag)
        
        
       
        
        
        /*self.showFreeShareButton = Observable
            .merge(
                priceValue.map{ $0 ?? "nil" == "0"},
                freeShareButtonTapped.map{_ in false}
            )
            .asSignal(onErrorJustReturn: false)*/
        
        
        
        // Observable
        //            .merge(
        //            alertSheetForSorting,
        //            alertForErrorMessage)
        //            .asSignal(onErrorSignalWith: .empty())
        //            .flatMapLatest{ alert -> Signal<AlertAction> in
        //                let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: alert.style)
        //                return self.presentAlertController(alertController, actions: alert.actions)
        //            }
        //            .emit(to: alertActionTapped)
        //            .disposed(by: disposeBag)
        
        
        
    }
    private func attribute(){
        self.backgroundColor = .white
    }
}
