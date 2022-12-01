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
    var a: Bool = false
    var temp_for_hide: Bool = false
    let disposeBag = DisposeBag()
    
    // ------------------------------ UI Components ------------------------------ //
    
    //검색 바
    let searchBar = SearchBar()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0.0
        return stackView
    }()
    
    
    //배너
    
    private lazy var bvLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWidth , height: 100)
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
        layout.itemSize = CGSize(width: (screenWidth - 50) / 4, height: 90)
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
    
    let listView = SearchResultTableView()
    let listBorderView = UIView()
    let listFooterView = UIView()
    //let searchResultlistView = SearchResultTableView()
    
    // ------------------------------ UI Components ------------------------------ //
    
    
    // ------------------------------ Rx Traits ------------------------------ //
    
    // TabBarController에서 AlertController가 표현되지 않는다면 다른 ViewController로 옮겨줘야함
    // 버튼이 tap되었고, 새 글 작성, 옷장에 옷걸기 중 어떤것이 선택되었는지 그 정보를 함께 받아옴
    let alertActionTapped = PublishRelay<AlertAction>()
    
    let centerButtonTapped1 = PublishRelay<Void>()
    let cmChoiceIndex = PublishRelay<Int>()
    
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
//    override func viewDidAppear(_ animated: Bool) {
//        let vc = PostDetailViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    private func bind() {
       
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

//        let blogError = blogResult
//            .compactMap { data -> String? in
//                guard case .failure(let error) = data else {
//                    return nil
//                }
//                return error.localizedDescription
//            }

        //네트워크를 통해 가져온 값을 cellData로 변환
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
////
        //MainViewController -> ListView 아이템들을 뿌려주도록!!

        //FilterView를 선택했을 때 나오는 alertSheet을 선택했을 때 type
        //true인 것들 즉, newPost, addMyClothes만 걸러서 전달해준다.
        let sortedType = alertActionTapped
            .filter{
                switch $0 {
                case .newPost, .addMyClothes:
                    print("true 선택")

                    return true
                default:
                    print("false 선택")
                    return false
                }
            }.subscribe(
                onNext:{ _ in
                    print("kkkkk")
                },
                onCompleted:{
                    print("completed")
                    
                }
            
            ).disposed(by: disposeBag)
            //.startWith(.newPost)
        //첫 시작은 new_
        
//        sortedType
//            .flatMapLatest{ type -> Void in
//                       switch type {
//                       case .newPost:
//                           print("눌렀네?")
//                           let vc = NewPostViewController()
//                           self.navigationController!.pushViewController(vc, animated: true)
//                       case .addMyClothes:
//                          break
//                       default:
//                           break
//                       }
//                   }
            //.disposed(by: disposeBag)
        

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
        
        
//
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
        
//        //에러일 때도 Alert로 반환해줌
//        let alertForErrorMessage = blogError
//            .map{ message -> Alert in
//                return (
//                    title: "앗",
//                    message: "예상치 못한 오류 발생 잠시후 다시 시도. \(message)",
//                    actions: [.cancel],
//                    style: .alert
//                )
//            }
        
//
//        Observable
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
//
        Observable<[SearchResultCellData]>.of([
            
            SearchResultCellData(title: "임시 title1임시 title1임시 title1임시 title1임시 title1임시 title1임시 title1임시 title1임시 title1임시 title1임시 title1임시 title1", price: 10000, content: "임시 content1임시 content1임시 content1임시 content1임시 content1임시 content1임시 content1임시 content1임시 content1임시 content1임시 content1임시 content1", status: "판매중 임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title2", price: 20000, content: "임시 content2", status: "판매완료임시", transport: "택배", datetime: Date(), thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title3", price: 30000, content: "임시 content3", status: "판매중", transport: "직거래", datetime: Date(), thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title11", price: 10000, content: "임시 content1", status: "판매중 임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title21", price: 20000, content: "임시 content2", status: "판매완료임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title31", price: 30000, content: "임시 content3", status: "판매중", transport: "직거래", datetime: Date(), thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title12", price: 10000, content: "임시 content1", status: "판매중 임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title22", price: 20000, content: "임시 content2", status: "판매완료임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title32", price: 30000, content: "임시 content3", status: "판매중", transport: "직거래", datetime: Date(), thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title13", price: 10000, content: "임시 content1", status: "판매중 임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title24", price: 20000, content: "임시 content2", status: "판매완료임시", transport: "직거래", datetime: Date(), thumbnailImageUrl: nil),
            SearchResultCellData(title: "임시 title35", price: 30000, content: "임시 content3", status: "판매중", transport: "직거래", datetime: Date(), thumbnailImageUrl: nil)
        ])
            .bind(to: listView.cellData)
            .disposed(by: disposeBag)

        listView.postCellData
            .subscribe(
                onNext: { pcd in
                    print(pcd)
                    print("pcd 전송 완료")
                    let vc = PostDetailViewController(pcData: pcd)
                    self.navigationController?.pushViewController(vc, animated: true)
                }, onError: { error in
                    print(error)
                }, onCompleted: {
                    print("끝")
                })
            .disposed(by: disposeBag)
        // 대분류를 선택한다면
        // 소분류 항목들을 변경해야함
        //
        categoryMainListView.cmChoiceIndex
            .map{ idx in // section은 하나이므로, row만 넘겨주면 됨
                return idx
            }
            .bind(to: self.cmChoiceIndex)
            .disposed(by: disposeBag)
        
        self.cmChoiceIndex
            .startWith(0)
            .share()
            .bind(to: categorySubListView.cmChoiceIndex)
            .disposed(by: disposeBag)
        
        self.cmChoiceIndex
            .subscribe(
            onNext:{ index in
                print(index)
//                    self.temp_for_hide = !self.temp_for_hide
//                    self.categorySubListView.isHidden = self.temp_for_hide
            }
        )
            .disposed(by: disposeBag)
            
    }
    
    private func attribute(){
        title = "검색"
        view.backgroundColor = .systemBackground
        scrollView.backgroundColor = .systemBackground
        contentView.backgroundColor = .systemBackground
        stackView.backgroundColor = .systemBackground
        listBorderView.backgroundColor = .lightGray
        listFooterView.backgroundColor = .systemBackground
    }
    
    private func layout(){
        
        
       
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.top.equalTo(searchBar.snp.bottom)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            //가로를 고정시켜주어 세로스크롤 뷰가 된다.
            $0.width.equalToSuperview()
        }
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        //stackView에 컴포넌트들 추가
        [ bannerListView, sortFilterView, categoryMainListView,categorySubListView, listView, listBorderView, listFooterView].forEach{
            stackView.addArrangedSubview($0)
        }
        
       
        
        bannerListView.snp.makeConstraints{
//            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        sortFilterView.snp.makeConstraints{
            $0.top.equalTo(bannerListView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        categoryMainListView.snp.makeConstraints{
            $0.top.equalTo(sortFilterView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(110)
        }
        //categoryMainListView.isHidden = true
        //categoryMainListView.snp.height.equalTo(0.0)
        
        categorySubListView.snp.makeConstraints{
            $0.top.equalTo(categoryMainListView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(90)
            //$0.height.equalTo(90)
        }
        
        listView.snp.makeConstraints{
            $0.top.equalTo(categorySubListView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(800)
//            $0.bottom.equalToSuperview()
        }
        
        listBorderView.snp.makeConstraints{
            $0.top.equalTo(listView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
//            $0.bottom.equalToSuperview()
        }
        
        listFooterView.snp.makeConstraints{
            $0.top.equalTo(listBorderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
//            $0.bottom.equalToSuperview()
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
            default:
                return .destructive
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
                    print("print했다")
                    //현재의 탭바의 index를 바꾸어 항상 검색 탭 위에서 새 글을 작성할 수 있게 하였음
                    if let tabBarController = self.tabBarController as? UITabBarController {
                        tabBarController.selectedIndex = 1
                    }
                    let vc = NewPost2ViewController()
//                    let npvm = NewPostViewModel()
//                    vc.bind(npvm)
                   
//                    self.navigationController!.pushViewController(vc, animated: true)
                      self.navigationController!.present(vc, animated: true, completion: {print("새글!")})
                }
            }
            .asSignal(onErrorSignalWith: .empty())
    }
}

