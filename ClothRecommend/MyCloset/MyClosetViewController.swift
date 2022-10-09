//
//  UsedMarketViewcontroller.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit


class MyClosetViewController: UIViewController {
    
    let usedMarketView = MyClosetCollectionView()
    
    var numberOfMiddlethings = 5
    
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
        if collectionView.tag == 1 {
            return 3
        } else {
            if section == 0 {
                return numberOfMiddlethings
            } else {
                return 20
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 1 {
            return 1
        } else {
            return 2
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            
            cell.categoryImage.image = UIImage(named: "dog")
            cell.layer.cornerRadius = cell.frame.height / 2
            return cell
            
        } else {
            if indexPath.section == 0 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiddleCategoryCell.identifier, for: indexPath) as? MiddleCategoryCell else { return UICollectionViewCell() }
                
                cell.categoryLabel.text = "hello world"
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyClosetCell.identifier, for: indexPath) as? MyClosetCell else { return UICollectionViewCell() }
            
                cell.clothImage.image = UIImage(named: "dog")
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
            print(collectionView.tag, indexPath)
            
            if indexPath.row == 0 {
                numberOfMiddlethings = 4
            } else if indexPath.row == 1 {
                numberOfMiddlethings = 2
            } else {
                numberOfMiddlethings = 11
            }
            
            usedMarketView.usedMarketCollectionView.reloadData()
            
        } else if collectionView.tag == 2 {
            print(collectionView.tag, indexPath)
        } else {
            let vc = MyClosetDetailViewController()

            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
