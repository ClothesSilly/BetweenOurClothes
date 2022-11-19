//
//  DetailFilterViewController.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/13.
//

import UIKit

protocol SendFilterData {
    func sendFilterViewModel(viewModel: DetailFilterViewModel)
}

class DetailFilterViewController: UIViewController {
    
    let filterView = DetailFilterView()
    
    var delegate: SendFilterData?
    // 이 아래 뷰모델을 전 화면으로 넘겨줘야 함.
    let filterViewModel = DetailFilterViewModel()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate?.sendFilterViewModel(viewModel: filterViewModel)
    }
    
    
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
            label.text = filterViewModel.model.styleFilter[indexPath.row]
        }


        label.sizeToFit()
        let cellWidth = label.frame.width + 25
        return CGSize(width: cellWidth, height: 35)
    }
    
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFilterCollectionViewCell.identeifer, for: indexPath) as? DetailFilterCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.section == 0 {
            if filterViewModel.colorSelectedIndex == indexPath.row  {
                cell.backgroundColor = UIColor(red: 241/255, green: 191/255, blue: 220/255, alpha: 1)
            } else {
                cell.backgroundColor = .white
            }
            cell.detailText.text = filterViewModel.model.colorFilter[indexPath.row]
        } else if indexPath.section == 1 {
            if filterViewModel.fitSelectedIndex == indexPath.row {
                cell.backgroundColor = UIColor(red: 241/255, green: 191/255, blue: 220/255, alpha: 1)
            } else {
                cell.backgroundColor = .white
            }
            cell.detailText.text = filterViewModel.model.fitFilter[indexPath.row]
        } else if indexPath.section == 2 {
            if filterViewModel.legnthSelectedIndex == indexPath.row {
                cell.backgroundColor = UIColor(red: 241/255, green: 191/255, blue: 220/255, alpha: 1)
            } else {
                cell.backgroundColor = .white
            }
            cell.detailText.text = filterViewModel.model.lengthFilter[indexPath.row]
            
        } else {
            if filterViewModel.textureSelectedIndex == indexPath.row {
                cell.backgroundColor = UIColor(red: 241/255, green: 191/255, blue: 220/255, alpha: 1)
            } else {
                cell.backgroundColor = .white
            }
            cell.detailText.text = filterViewModel.model.styleFilter[indexPath.row]
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
            header.filterHeader.textColor = .systemGreen
            header.filterHeader.font = UIFont.boldSystemFont(ofSize: 17)
            
            
        
            
            return header
        }
        return UICollectionReusableView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filterViewModel.filterSelectionAt(indexPath: indexPath)
        collectionView.reloadData()
    }
}
