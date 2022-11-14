//
//  UsedDetailViewController.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit

class MyClosetDetailViewController: UIViewController {
    
    // TODO: need to change to real 
    var imageCell: ClosetImageTableViewCell?
    let numberOfImages = 4
    
    let usedDetailView = MyClosetDetailView()
    
    override func loadView() {
        self.view = usedDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usedDetailView.closetDetailTableView.delegate = self
        usedDetailView.closetDetailTableView.dataSource = self
    }
}

extension MyClosetDetailViewController {
    @objc func updateImage(_ pageControl: UIPageControl) {
        let selectedIndex = pageControl.currentPage
        imageCell?.imagesCollection.scrollToItem(at: IndexPath(row: selectedIndex, section: 0), at: .left, animated: true)
    }
    
        
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
           let nextPage = Int(targetContentOffset.pointee.x / self.view.frame.width)
        if scrollView.tag == 2 {
            imageCell!.imageControl.currentPage = nextPage
            usedDetailView.closetDetailTableView.reloadData()
        }

   }
    
}

extension MyClosetDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.section == 0 {
            return 50
        } else if indexPath.section == 1 {
            return 500
        } else {
            return 1000
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ClosetTagTableViewCell.identifer,
                for: indexPath
            ) as? ClosetTagTableViewCell else {
                return UITableViewCell()
            }
            cell.tagCollectionView.delegate = self
            cell.tagCollectionView.dataSource = self
            
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ClosetImageTableViewCell.identifier,
                for: indexPath
            ) as? ClosetImageTableViewCell else {
                return UITableViewCell()
            }
            
            cell.imagesCollection.delegate = self
            cell.imagesCollection.dataSource = self
            cell.imageControl.numberOfPages = numberOfImages
            cell.imageControl.addTarget(self, action: #selector(updateImage), for: .allEvents)
            imageCell = cell
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MyClosetDetailRecommendTableViewCell.identifier,
                for: indexPath
            ) as? MyClosetDetailRecommendTableViewCell else {
                return UITableViewCell()
            }
            
            cell.recommendCollectionView.delegate = self
            cell.recommendCollectionView.dataSource = self
            
            return cell
        }
    }
    
    
}
extension MyClosetDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 3 {
            print(indexPath)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 2 {
            return numberOfImages
        } else {
            return 100
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else { return
                UICollectionViewCell()
            }
            
            cell.tagLabel.text = "상의"
            
            return cell
        } else if collectionView.tag == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyClosetDetailCell.identifier, for: indexPath) as? MyClosetDetailCell else { return
                UICollectionViewCell()
            }
            cell.clothImageView.image = UIImage(named: "dog")
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommenCollectionViewCell.identifier, for: indexPath) as? RecommenCollectionViewCell else { return
                UICollectionViewCell()
            }
            cell.recommendImageView.contentMode = .scaleToFill
            cell.recommendImageView.image = UIImage(named: "dog")
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: 50, height: 30)
        } else if collectionView.tag == 2{
            return collectionView.frame.size
        } else {
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.width / 3)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView.tag == 1 {
            return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    

    
}
