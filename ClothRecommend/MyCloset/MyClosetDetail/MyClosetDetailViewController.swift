//
//  UsedDetailViewController.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit

class MyClosetDetailViewController: UIViewController {
    
    // TODO: need to change to real d
    let numberOfImages = 4
    let usedDetailView = MyClosetDetailView()
    
    override func loadView() {
        self.view = usedDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usedDetailView.closetDetailTableView.delegate = self
        usedDetailView.closetDetailTableView.dataSource = self
        usedDetailView.imageControl.numberOfPages = numberOfImages
        usedDetailView.imageControl.addTarget(self, action: #selector(updateImage), for: .allEvents)

    }
}

extension MyClosetDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    @objc func updateImage() {
        guard let cell = usedDetailView.closetDetailTableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? ClosetImageTableViewCell else { return }
        
        print("h")
        cell.imagesCollection.scrollToItem(at: IndexPath(row: 5, section: 0), at: .left, animated: true)
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
           let nextPage = Int(targetContentOffset.pointee.x / self.view.frame.width)
        
        usedDetailView.imageControl.currentPage = nextPage
        print(usedDetailView.imageControl.currentPage)
       }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    
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
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ClosetImageTableViewCell.identifier,
                for: indexPath
            ) as? ClosetImageTableViewCell else {
                return UITableViewCell()
            }
            
            cell.imagesCollection.delegate = self
            cell.imagesCollection.dataSource = self
            cell.imageControl.numberOfPages = numberOfImages
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else {
            return 500
        }
    }
    
}
extension MyClosetDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else { return
                UICollectionViewCell()
            }
            
            cell.tagLabel.text = "상의"
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyClosetDetailCell.identifier, for: indexPath) as? MyClosetDetailCell else { return
                UICollectionViewCell()
            }
            cell.clothImageView.image = UIImage(named: "dog")
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: 50, height: 30)
        } else {
            return collectionView.frame.size
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
        if collectionView.tag == 1 {
            return 5.0
        } else {
            return 0.0
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1 {
            return 2.0
        } else {
            return 0.0
        }
        
    }
    
}
