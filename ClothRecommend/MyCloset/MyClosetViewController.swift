//
//  UsedMarketViewcontroller.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit


class MyClosetViewController: UIViewController {
    
    let usedMarketView = MyClosetCollectionView()
    
    override func loadView() {
        self.view = usedMarketView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usedMarketView.categoryCollectionView.delegate = self
        usedMarketView.categoryCollectionView.dataSource = self
        
        usedMarketView.usedMarketCollectionView.delegate = self
        usedMarketView.usedMarketCollectionView.dataSource = self
        
    }

    

    
}


extension MyClosetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            
            cell.categoryImage.image = UIImage(named: "dog")
            cell.layer.cornerRadius = cell.frame.height / 2
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyClosetCell.identifier, for: indexPath) as? MyClosetCell else { return UICollectionViewCell() }
        
            cell.clothImage.image = UIImage(named: "dog")
            return cell
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//        if collectionView.tag == 2 {
//            if indexPath.section == 0 {
//                let header =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendCollectionHeader.identifier, for: indexPath)
//                //        if kind == UICollectionView.elementKindSectionHeader {
//                //        } else {
//                //        }
//                
//                return header
//            } else {
//    //            return UICollectionReusableView()
//            }
//        }
//        
//        
//        
//        let header =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendCollectionHeader.identifier, for: indexPath)
//        
//        return header
//    }

    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        CGSize(width: self.view.frame.width, height: 100)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: 65, height: 65)
        } else {
            return CGSize(width: (collectionView.frame.width / 3) - 1, height: (self.view.frame.width / 3))
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1{
            return 10
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView.tag == 1{
            return 10
        } else {
            return 1
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            print(collectionView.tag, indexPath)
        } else {
            let vc = UsedDetailViewController()

            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
