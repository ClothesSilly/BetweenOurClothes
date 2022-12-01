//
//  BannerListView.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//

import UIKit
import RxSwift
import RxCocoa

final class BannerListView: UICollectionView {
    let disposeBag = DisposeBag()
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    //TODO: 데이터는 받아와서 뿌리는 것으로 바꿔야함
    //최상위 ViewController에서 배너 이미지를 받아와 이곳에 bind해줄 것이다.
    //let cellData = PublishSubject<[BannerTableViewCellData]>()
//    let cellData = Observable.of([
//        BannerCellData(bannerImage: "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"),
//        BannerCellData(bannerImage: nil),
//        BannerCellData(bannerImage: nil),
//        BannerCellData(bannerImage: nil),
//        BannerCellData(bannerImage: nil)
//    ])
    
    let cellData = PublishRelay<[BannerCellData]>()
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.register(BannerListViewCell.self, forCellWithReuseIdentifier: "BannerListViewCell")
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = true
   
        print("p1")
        bind()
        print("p2")
        attribute()
        startAdsBannerLoop()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func bind(){
        
//        let blogResult = Observable.just(1)
//            .flatMapLatest { _ in
//
//                return GetBannerNetwork().getBanner()
//
//            }
//            .share()
//        print("blogResult = ", blogResult)
////
//        let blogValue = blogResult
//            .compactMap{ data -> [BannerImage] in
//                print("2")
//                guard case .success(let value) = data else {
//                    return []
//                }
//                return value
//            }
//        print("blogValue = ", blogValue)
//
//        let blogError = blogResult
//            .compactMap { data -> String? in
//                guard case .failure(let error) = data else {
//                    return nil
//                }
//                return error.localizedDescription
//            }
//
//        //네트워크를 통해 가져온 값을 cellData로 변환
//        let bannerCellData = blogValue
//            .map{banner -> [BannerCellData] in
//                print("3")
//                return banner
//                    .map{ img in
//                        print("4")
//                        return BannerCellData(bannerImage: img.image)
//                    }
//            }
//
//
//        bannerCellData
//            .bind(to: bannerListView.cellData)
//            .disposed(by: disposeBag)
        
        
//        cellData.subscribe(
//            onNext:{
//                print("kkqq")
//                print($0)
//            }
//        )
        
        cellData
            .startWith([
                BannerCellData(bannerImage: nil),
                BannerCellData(bannerImage: nil),
                BannerCellData(bannerImage: nil),
                BannerCellData(bannerImage: nil),
                BannerCellData(bannerImage: nil)
            ])
            .bind(to: self.rx.items(
                cellIdentifier: "BannerListViewCell",
                cellType: BannerListViewCell.self
                )
            ){ index, data, cell in
                print("kkq")
                cell.setData(data)
            }
            .disposed(by:disposeBag)
        
    }
    
    private func attribute(){
        self.backgroundColor = .cyan
    
        //self.scroll
    }
    
    private var nowAdsPage: Int = 0
    func startAdsBannerLoop(){
            let _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                self.moveNextBanner()
            }
    }
    
    func moveNextBanner(){
            nowAdsPage += 1
            
            if(nowAdsPage >= 5){
                // 마지막이 지난 경우
                nowAdsPage = 0
            }
            self.scrollToItem(at: NSIndexPath(item: nowAdsPage, section: 0) as IndexPath, at: .right, animated: true)
        }
}
