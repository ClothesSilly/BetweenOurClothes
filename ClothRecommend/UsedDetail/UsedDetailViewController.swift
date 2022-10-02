//
//  UsedDetailViewController.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit

class UsedDetailViewController: UIViewController {
    
    let usedDetailView = UsedDetailView()
    
    override func loadView() {
        self.view = usedDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usedDetailView.imageCollectionView.delegate = self
        usedDetailView.imageCollectionView.dataSource = self
        usedDetailView.imageControl.numberOfPages = 4
    }
    
    
    override func viewDidLayoutSubviews() {
        usedDetailView.setUpScrollViewConstraints()
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.view.frame.width)
        usedDetailView.imageControl.currentPage = page
    }
    
}


extension UsedDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsedImageCell", for: indexPath) as? UsedImageCell else { return UICollectionViewCell() }
        
        print("SDg ")
        
        cell.clothImageView.image = UIImage(named: "dog")
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0.0 
    }
    
}
