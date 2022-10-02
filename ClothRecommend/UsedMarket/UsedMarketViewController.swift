//
//  UsedMarketViewcontroller.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit


class UsedMarketViewController: UIViewController {
    
    let usedMarketView = UsedMarketCollectionView()
    
    override func loadView() {
        self.view = usedMarketView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usedMarketView.usedMarketCollectionView.delegate = self
        usedMarketView.usedMarketCollectionView.dataSource = self
    }
    
    
//    override func viewWillLayoutSubviews() {
//        usedMarketView.usedMarketCollectionView.frame = self.view.frame
//    }
    
}


extension UsedMarketViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommend cell", for: indexPath) as? RecommendCollectionViewCell else { return UICollectionViewCell() }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            let header =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendCollectionHeader.identifier, for: indexPath)
            //        if kind == UICollectionView.elementKindSectionHeader {
            //        } else {
            //        }
            
            return header
        } else {
//            return UICollectionReusableView()
        }
        
        
        let header =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendCollectionHeader.identifier, for: indexPath)
        
        return header
        
        

        
        
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: self.view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (self.view.frame.width / 3) - 40, height: (self.view.frame.width / 3) - 40)
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UsedDetailViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
