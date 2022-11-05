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
    
    // ------------------------------ UI Components ------------------------------ //
    //검색 바
    let searchBar = SearchBar()
    
    //배너
    private lazy var bvLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWidth , height: 76)
        return layout
    }()
    
    private lazy var bannerListView = BannerListView(frame: .zero, collectionViewLayout: bvLayout)
    
    
   
    let sortFilterView = SortFilterView()
    //대분류
    private lazy var mcvLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - 50) / 4, height: 80)
        return layout
    }()
    
    private lazy var categoryMainListView = CategoryMainListView(frame: .zero, collectionViewLayout: mcvLayout)
    
    //소분류
    private lazy var scvLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 10
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - 60) / 5, height: 30)
        return layout
    }()
    
    private lazy var categorySubListView = CategorySubListView(frame: .zero, collectionViewLayout: scvLayout)
    
    let listView = BlogList()
    //let searchResultlistView = SearchResultTableView()
    
    // ------------------------------ UI Components ------------------------------ //
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    // TabBarController에서 AlertController가 표현되지 않는다면 다른 ViewController로 옮겨줘야함
    // 버튼이 tap되었고, 새 글 작성, 옷장에 옷걸기 중 어떤것이 선택되었는지 그 정보를 함께 받아옴
    let alertActionTapped = PublishRelay<AlertAction>()
    
    let centerButtonTapped1 = PublishRelay<Void>()
    
    // ------------------------------ Rx Traits ------------------------------ //
        

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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    private func bind() {
       
        let blogResult = searchBar.shouldLoadResult
            .flatMapLatest { query in
                SearchBlogNetwork().searchBlog(query: query)
            }
            .share()
//
        let blogValue = blogResult
            .compactMap{ data -> DKBlog? in
                guard case .success(let value) = data else {
                    return nil
                }
                return value
            }

        let blogError = blogResult
            .compactMap { data -> String? in
                guard case .failure(let error) = data else {
                    return nil
                }
                return error.localizedDescription
            }
        
        //네트워크를 통해 가져온 값을 cellData로 변환
        let cellData = blogValue
            .map{blog -> [BlogListCellData] in
                return blog.documents
                    .map{ doc in
                        let thumbnailURL = URL(string: doc.thumbnail ?? "")
                        return BlogListCellData(thumbnailURL: thumbnailURL, name: doc.name, title: doc.title, datetime: doc.datetime)
                    }
            }
        
        cellData
            .bind(to: listView.cellData)
            .disposed(by: disposeBag)
//
        //MainViewController -> ListView 아이템들을 뿌려주도록!!

        //FilterView를 선택했을 때 나오는 alertSheet을 선택했을 때 type
        let sortedType = alertActionTapped
            .filter{
                switch $0 {
                case .newPost, .addMyClothes:
                    return true
                default:
                    return false
                }
            }
            //.startWith(.newPost)
        //첫 시작은 new_
        

//        Observable
//            .combineLatest(sortedType, cellData){
//                type, data -> [BlogListCellData] in
//                switch type {
//                case .newPost:
//                    return data.sorted{ $0.title ?? "" < $1.title ?? ""}
//                case .addMyClothes:
//                    return data.sorted {$0.datetime ?? Date() > $1.datetime ?? Date()}
//                default:
//                    return data
//                }
//            }
//            .bind(to: listView.cellData)
//            .disposed(by: disposeBag)
        
        
        
        //사실 여기서 받아오는 것은 없음. 클릭되었다는 "신호"만 갖고 정해진 AlertController를 띄우는 것임
        let alertSheetForSorting = centerButtonTapped1
            .map{ _ -> Alert in
                return(title: nil, message: nil, actions: [.newPost, .addMyClothes, .cancel], style: .actionSheet)
            }
        //에러일 때도 Alert로 반환해줌
        let alertForErrorMessage = blogError
            .map{ message -> Alert in
                return (
                    title: "앗",
                    message: "예상치 못한 오류 발생 잠시후 다시 시도. \(message)",
                    actions: [.cancel],
                    style: .alert
                )
            }
        
        
        Observable
            .merge(
            alertSheetForSorting,
            alertForErrorMessage)
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
        [searchBar, bannerListView, sortFilterView, categoryMainListView,categorySubListView, listView].forEach {
            view.addSubview($0)
        }
        searchBar.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        bannerListView.snp.makeConstraints{
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        
        sortFilterView.snp.makeConstraints{
            $0.top.equalTo(bannerListView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        categoryMainListView.snp.makeConstraints{
            $0.top.equalTo(sortFilterView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(100)
        }
        //categoryMainListView.isHidden = true
        //categoryMainListView.snp.height.equalTo(0.0)
        
        categorySubListView.snp.makeConstraints{
            $0.top.equalTo(categoryMainListView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(90)
        }
        
        listView.snp.makeConstraints{
            $0.top.equalTo(categorySubListView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


extension UIViewController {
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

