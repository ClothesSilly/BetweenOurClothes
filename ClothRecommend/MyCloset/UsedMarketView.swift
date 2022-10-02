////
////  UsedMarketView.swift
////  ClothRecommend
////
////  Created by USER on 2022/10/01.
////
//
//import UIKit
//import SnapKit
//
//class UsedMarketView: UIView {
//    
//    let usedMarketScrollView = UIScrollView()
//    
//    // MARK: top Category part
//    let bigCategoryView = UIView()
//    let categoryStack = UIStackView()
//    let categoryHat = UIButton()
//    let categoryTop = UIButton()
//    let categoryPants = UIButton()
//    let categoryShoes = UIButton()
//    let categoryBags = UIButton()
//    
//    
//    
//    // MARK: Recommend Cloth part
//    
//    let recommendLabel = UILabel()
//    
//    
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUp()
//        setUpConstraints()
//        setUpScrollView()
//        setUpConstraintsForScrollView()
//
//        setUpCategoryView()
//        setUpConstraintsForCategoryStack()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setUp()
//        setUpConstraints()
//        setUpScrollView()
//        setUpConstraintsForScrollView()
//
//        setUpCategoryView()
//        setUpConstraintsForCategoryStack()
//    }
//    
//    
//    private func setUp() {
//        backgroundColor = .white
//        
//        bigCategoryView.backgroundColor = .red
//        
//        self.addSubview(usedMarketScrollView)
//        usedMarketScrollView.backgroundColor = .yellow
//    }
//    
//    private func setUpScrollView() {
//        usedMarketScrollView.addSubview(bigCategoryView)
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    private func setUpCategoryView() {
//        bigCategoryView.addSubview(categoryStack)
//        
//        categoryStack.addArrangedSubview(categoryTop)
//        categoryStack.addArrangedSubview(categoryHat)
//        categoryStack.addArrangedSubview(categoryPants)
//        categoryStack.addArrangedSubview(categoryBags)
//        categoryStack.addArrangedSubview(categoryShoes)
//        
//        categoryTop.backgroundColor = .white
//        categoryPants.backgroundColor = .green
//        categoryShoes.backgroundColor = .black
//        categoryHat.backgroundColor = .blue
//        categoryBags.backgroundColor = .brown
//        
//        
//        categoryStack.axis = .horizontal
//        categoryStack.spacing = 10
//        categoryStack.distribution = .fillEqually
//                    
//    }
//    
//    private func setUpConstraintsForCategoryStack() {
//        categoryStack.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(8)
//            make.leading.equalToSuperview().offset(8)
//            make.bottom.equalToSuperview().offset(-8)
//            make.trailing.equalToSuperview().offset(-8)
//        }
//    }
//    
//    
//    private func setUpConstraints() {
//        usedMarketScrollView.snp.makeConstraints { make in
//            make.edges.equalTo(safeAreaLayoutGuide)
//        }
//    }
//    
//    private func setUpConstraintsForScrollView() {
//        bigCategoryView.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(20)
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.height.equalTo(60)
//            make.width.equalToSuperview()
//        }
//    }
//    
//}
