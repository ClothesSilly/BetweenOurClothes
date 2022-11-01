//
//  UsedTradeViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//


import UIKit
import RxSwift
import RxCocoa
//import Kingfisher

class UsedTradeViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    // components
    let searchBar = SearchBar()
    let sortFilterView = SortFilterView()
    let searchResultlistView = SearchResultTableView()
    
    // Rx subjects
    // TabBarController에서 AlertController가 표현되지 않는다면 다른 ViewController로 옮겨줘야함
    // 버튼이 tap되었고, 새 글 작성, 옷장에 옷걸기 중 어떤것이 선택되었는지 그 정보를 함께 받아옴
    let alertActionTapped = PublishRelay<AlertAction>()
    
    let centerButtonTapped1 = PublishRelay<Void>()
        

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
        bind()
        attribute()
        layout()
//        self.centerButtonTapped
//            .subscribe( onNext:{
//                //UIWindowScene.windows.filter({$0.isKeyWindow}).first
//                //UIApplication.shared.windows.filter({$0.isKeyWindow}).first as? UIViewController
//                print("kk")
//                let alert = UIAlertController(title: "타이틀", message: "메시지", preferredStyle:UIAlertController.Style.alert)
//                let action1 = UIAlertAction(title:"헤헤", style: .default)
//                alert.addAction(action1)
//                self.present(alert, animated: true, completion: nil)
//                }
//            ).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
       
        //사실 여기서 받아오는 것은 없음. 클릭되었다는 "신호"만 갖고 정해진 AlertController를 띄우는 것임
        let alertSheetForSorting = centerButtonTapped1
            .map{ _ -> Alert in
                return(title: nil, message: nil, actions: [.newPost, .addMyClothes, .cancel], style: .actionSheet)
            }
        
        alertSheetForSorting
            .asSignal(onErrorSignalWith: .empty())
            .flatMapLatest{ alert -> Signal<AlertAction> in
                let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: alert.style)
                return self.presentAlertController(alertController, actions: alert.actions)
            }
            .emit(to: alertActionTapped)
            .disposed(by: disposeBag)
    }
    private func attribute(){
        title = "검색"
        view.backgroundColor = .white
    }
    private func layout(){
        [searchBar, sortFilterView, searchResultlistView].forEach {
            view.addSubview($0)
        }
        searchBar.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        sortFilterView.snp.makeConstraints{
            $0.top.equalTo(searchResultlistView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        searchResultlistView.snp.makeConstraints{
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}



extension UsedTradeViewController {
    typealias Alert = (title: String?, message: String?, actions: [AlertAction], style: UIAlertController.Style)
    
    enum AlertAction: AlertActionConvertible {
        //AlertController 의 Actionsheet에 표현될 것들
        case newPost, addMyClothes, cancel
        
        //연산 프로퍼티 선언 String
        var title: String {
            switch self {
            case .newPost:
                return "새 게시글 작성"
            case .addMyClothes:
                return "내 옷장에 옷 걸기"
            case .cancel:
                return "취소"
            }
        }
        
        //각 항목들을 어떻게 표현할지
        var style: UIAlertAction.Style{
            switch self {
                case .newPost, .addMyClothes:
                return .default
                case .cancel:
                return .cancel
            }
        }
    }
    
    //Action은 AlertActionConvertible 프로토콜을 따르는 타입이어야하고,
    func presentAlertController<Action: AlertActionConvertible>(_ alertController: UIAlertController, actions: [Action]) -> Signal<Action> {
        if actions.isEmpty{ return .empty()}
        return Observable
            .create{ [weak self] observer in
                guard let self = self else { return Disposables.create()}
                // AlertAction과 같이 AlertActionConvertible 프로토콜을 따르는 타입 인스턴스들을 AlertController에 추가
                for action in actions {
                    alertController.addAction(
                        //기본적으로 AlertController에 들어가는 UIAlertAction 형태
                        UIAlertAction(
                            title: action.title,
                            style: action.style,
                            handler: {_ in
                                observer.onNext(action)
                                observer.onCompleted()
                            }
                        )
                    )
                }
                self.present(alertController, animated: true, completion: nil)
                return Disposables.create {
                    alertController.dismiss(animated: true, completion: nil)
                }
            }
            .asSignal(onErrorSignalWith: .empty())
    }
}

