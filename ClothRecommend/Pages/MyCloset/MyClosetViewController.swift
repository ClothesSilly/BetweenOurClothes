//
//  UsedMarketViewcontroller.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit
import RxSwift
import RxCocoa

class MyClosetViewController: UIViewController {
    
    var bigTap = 0
    var middleTap = 0 {
        didSet {
            let big = myClosetViewModel.bigCategoryNameAt(indexPath: IndexPath(row: bigTap, section: 0))
            let small = myClosetViewModel.middleCategoryNameAt(big: bigTap, indexPath: middleTap)
            MyClothetApiService.filterClothes(nameL: big, nameS: small,color: nil, fit: nil, length: nil, style: nil) { filteredData in
                self.contents = filteredData.content
                DispatchQueue.main.async {
                    self.usedMarketView.usedMarketCollectionView.reloadData()
                }
            }
            
        }
    }
    
    let disposeBag = DisposeBag()
    let centerButtonTapped = PublishRelay<Void>()
    
    let usedMarketView = MyClosetCollectionView()
    let myClosetViewModel = MyClosetViewModel()
    var filterViewModel: DetailFilterViewModel?
    var contents: [Content] = []
    
    override func loadView() {
        self.view = usedMarketView
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MyClothetApiService.filterClothes(nameL: nil, nameS: nil,color: nil, fit: nil, length: nil, style: nil) { filteredData in
            self.contents = filteredData.content
            DispatchQueue.main.async {
                self.usedMarketView.usedMarketCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usedMarketView.categoryCollectionView.delegate = self
        usedMarketView.categoryCollectionView.dataSource = self
        
        usedMarketView.usedMarketCollectionView.delegate = self
        usedMarketView.usedMarketCollectionView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        let vc = AddPostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
        let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
        let image = UIImage(data: imageData!)!
        return image
    }
}

extension MyClosetViewController: SendFilterData {
    
    
    func sendFilterViewModel(viewModel: DetailFilterViewModel) {
        filterViewModel = viewModel
        
        let big = myClosetViewModel.bigCategoryNameAt(indexPath: IndexPath(row: bigTap, section: 0))
        let small = myClosetViewModel.middleCategoryNameAt(big: bigTap, indexPath: middleTap)
        
        
        MyClothetApiService.filterClothes(nameL: big, nameS: small, color: viewModel.selectedColorName(), fit: viewModel.selectedFitName(), length: viewModel.selectedLengthName(), style: viewModel.selectedStyleName()) { filteredData in
            self.contents = filteredData.content
            DispatchQueue.main.async {
                self.usedMarketView.usedMarketCollectionView.reloadData()
            }
        }
    }
    
    
}


extension MyClosetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // 대 분류 [상위, 하위, 스웨터]
        if collectionView.tag == 1 {
            return 3
        }
        else {
            // 중분류 대분류에 따라 다름
            if section == 0 {
                return myClosetViewModel.numberOfMiddleFilters
            }
            // 소분류: 소분류 popup 올리기
            else if section == 1 {
                return 1
            }
            // 내 옷장 옷들
            else {
                // 이게 각 옷들
                return self.contents.count
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 1 {
            return 1
        } else {
            return 3
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            
            cell.categoryImage.image = myClosetViewModel.setBigCategoryImageAt(indexPath: indexPath)
            cell.layer.cornerRadius = cell.frame.height / 2
            return cell
            
        } else {
            if indexPath.section == 0 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiddleCategoryCell.identifier, for: indexPath) as? MiddleCategoryCell else { return UICollectionViewCell() }
                
                if indexPath.row == myClosetViewModel.selectedMiddleFilter {
                    cell.backgroundColor = .red
                } else {
                    cell.backgroundColor = .white
                }
                cell.categoryLabel.text = myClosetViewModel.cellForItemAt(indexPath: indexPath)
                return cell
            } else if indexPath.section == 1 {
                
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiddleCategoryCell.identifier, for: indexPath) as? MiddleCategoryCell else { return UICollectionViewCell() }
                
                cell.backgroundColor = .white
                cell.categoryLabel.text = "세부 필터"
                return cell
                
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyClosetCell.identifier, for: indexPath) as? MyClosetCell else { return UICollectionViewCell() }
                cell.clothImage.image = convertBase64StringToImage(imageBase64String: contents[indexPath.row].image)
                return cell
            }
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: 65, height: 65)
        } else {
            if indexPath.section == 0 {
                return CGSize(width: (collectionView.frame.width / 3) - 1, height: 30)
            } else if indexPath.section == 1 {
                return CGSize(width: 100, height: 50)
            } else {
                return CGSize(width: (collectionView.frame.width / 3) - 1, height: (self.view.frame.width / 3))
            }
            
        
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1{
            return 10
        } else if collectionView.tag == 2 {
            return 0
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView.tag == 1{
            return 10
        } else if collectionView.tag == 2 {
            return 0
        } else {
            return 1
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            myClosetViewModel.selectFilterAt(indexPath: indexPath)
            usedMarketView.usedMarketCollectionView.reloadData()
            usedMarketView.usedMarketCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            bigTap = indexPath.row
            
        } else {
            
            if indexPath.section == 0 {
                myClosetViewModel.selectedMiddleFilter = indexPath.row
                usedMarketView.usedMarketCollectionView.reloadData()
                middleTap = indexPath.row
            }
            else if indexPath.section == 1 {
                
                let vc = DetailFilterViewController()
                vc.delegate = self
                let nav = UINavigationController(rootViewController: vc)
                
                nav.isModalInPresentation = true

                if let sheet = nav.sheetPresentationController {
                    sheet.detents = [.medium()]
                }
                
                let close = UIBarButtonItem(title: "취소", image: nil, primaryAction: .init(handler: { _ in
                    if let sheet = nav.sheetPresentationController {
                        sheet.animateChanges {
                            self.dismiss(animated: true)
                        
                        }
                    }
                }))
                
                
                let large2 = UIBarButtonItem(title: "완료", image: nil, primaryAction: .init(handler: { _ in
                    if let sheet = nav.sheetPresentationController {
                        sheet.animateChanges {
                            self.dismiss(animated: true)
                        
                        }
                    }
                }))
                
                vc.navigationItem.leftBarButtonItem = close
                vc.navigationItem.rightBarButtonItem = large2
                
                present(nav, animated: true) {
                    //

                }
                
            } else {
                let vc = MyClosetDetailViewController()
                vc.postIndex = contents[indexPath.item].id
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
        
    }
}
