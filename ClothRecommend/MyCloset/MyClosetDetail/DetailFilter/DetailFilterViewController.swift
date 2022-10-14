//
//  DetailFilterViewController.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/13.
//

import UIKit

class DetailFilterViewController: UIViewController {
    
    let filterView = DetailFilterView()
    let filterViewModel = DetailFilterViewModel()
    
    override func loadView() {
        self.view = filterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterView.filterCollectionView.delegate = self
        filterView.filterCollectionView.dataSource = self
    }
    
}

extension DetailFilterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        filterViewModel.numberOfCategory
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterViewModel.numberOf(sectionIn: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 35
        return CGSize(width: width, height: height)
      }
    
    
    // 이 메서드가 문제 발생하네 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: DetailFilterCollectionViewCell.identeifer,
//                for: indexPath
//            ) as? DetailFilterCollectionViewCell else { return .zero }

        let label = UILabel()
        if indexPath.section == 0 {
            label.text = filterViewModel.model.colorFilter[indexPath.row]
        } else if indexPath.section == 1 {
            label.text = filterViewModel.model.fitFilter[indexPath.row]
        } else if indexPath.section == 2 {
            label.text = filterViewModel.model.lengthFilter[indexPath.row]
        } else {
            label.text = filterViewModel.model.textureFilter[indexPath.row]
        }


        label.sizeToFit()
        let cellWidth = label.frame.width + 25
        return CGSize(width: cellWidth, height: 35)
    }
    
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFilterCollectionViewCell.identeifer, for: indexPath) as? DetailFilterCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.section == 0 {
            cell.detailText.text = filterViewModel.model.colorFilter[indexPath.row]
        } else if indexPath.section == 1 {
            cell.detailText.text = filterViewModel.model.fitFilter[indexPath.row]
        } else if indexPath.section == 2 {
            cell.detailText.text = filterViewModel.model.lengthFilter[indexPath.row]
        } else {
            cell.detailText.text = filterViewModel.model.textureFilter[indexPath.row]
        }
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: FilterHeader.identifier,
                for: indexPath
            ) as? FilterHeader else { return UICollectionReusableView() }
            
            header.filterHeader.text = filterViewModel.headerTextIn(section: indexPath.section)
            
            return header
        }
        return UICollectionReusableView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
