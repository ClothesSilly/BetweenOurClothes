//
//  AddClothViewController.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/16.
//

import UIKit
import PhotosUI

extension AddClothViewController: SendFilterData {
    
    func sendFilterViewModel(viewModel: DetailFilterViewModel) {
        filterViewModel = viewModel
    }
    
}

extension AddClothViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddBigFilterTableviewCell.identifier, for: indexPath) as? AddBigFilterTableviewCell else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            cell.title.text = "상의"
        } else if indexPath.row == 1 {
            cell.title.text = "하의"
        } else if indexPath.row == 2 {
            cell.title.text = "아웃터"
        } else {
            cell.title.text = "원피스"
        }
        
        if indexPath.row == selelctedIndex {
            cell.backgroundColor = UIColor(red: 241/255, green: 191/255, blue: 220/255, alpha: 1)
        }else {
            cell.backgroundColor = .white
        }
        
        
                
                
        return cell
                
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selelctedIndex = indexPath.row
        tableView.reloadData()
    }
    
    
}

class AddClothViewController: UIViewController {
    
    var selelctedIndex = 0
    let addClothView = AddClothView()
    var selectedImages: [UIImage] = []
    var filterViewModel: DetailFilterViewModel?
    
    override func loadView() {
        self.view = addClothView
        addClothView.categoryTableView.register(AddBigFilterTableviewCell.self, forCellReuseIdentifier: AddBigFilterTableviewCell.identifier)
        addClothView.categoryTableView.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addClothView.selectedImageCollectionView.delegate = self
        addClothView.selectedImageCollectionView.dataSource = self
        
        addClothView.categoryTableView.delegate = self
        addClothView.categoryTableView.dataSource = self
        
        
        
        addClothView.selectPhoto.addTarget(self, action: #selector(showPhotoPicker), for: .touchUpInside)
        addClothView.sumbitButton.addTarget(self, action: #selector(savePhoto), for: .touchUpInside)
        addClothView.filterButton.addTarget(self, action: #selector(openFilterSelector), for: .touchUpInside)
    }
    
    
    @objc func openFilterSelector() {
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

        }
    }
    
    
    
    @objc func showPhotoPicker() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .any(of: [.images])
        configuration.selectionLimit = 5
        
        let pickerViewController = PHPickerViewController(configuration: configuration)
        pickerViewController.delegate = self
    
        self.present(pickerViewController, animated: true, completion: nil)
    }
    
    @objc func savePhoto() {
        var big = ""
        if selelctedIndex == 0 {
         big = "상의"
        } else if selelctedIndex == 1 {
            big = "하의"
        }  else if selelctedIndex == 2 {
            big = "아웃터"
        } else if selelctedIndex == 3 {
            big = "원피스"
        }
        
        
        MyClothetApiService.uploadMyCloth(style: nil, large_category: big, small_category: nil, fit: filterViewModel?.selectedFitName(), length: filterViewModel?.selectedLengthName(), color: filterViewModel?.selectedColorName(), material: filterViewModel?.selectedStyleName(), images: selectedImages) { response in
            if response == "200" {
                let alert = UIAlertController(title: "완성", message: "옷 올리기 성공", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    
                   }
                alert.addAction(okAction)
                DispatchQueue.main.async {
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    

    
}

extension AddClothViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        
    
        self.dismiss(animated: true, completion: nil)
        for result in results {
            let a = result.itemProvider
            if a.canLoadObject(ofClass: UIImage.self) {
                a.loadObject(ofClass: UIImage.self) { (image, error) in
                    if let b = image as? UIImage {
                        self.selectedImages.append(b)
                        
                        DispatchQueue.main.async {
                            self.addClothView.selectedImageCollectionView.reloadData()
                        }
                    }
                    
              }
            }
        }
        
        
        
        
        
        
        
//        let itemProvider = results.first?.itemProvider
//        self.dismiss(animated: true, completion: nil)
//        if let itemProvider = itemProvider,
//           itemProvider.canLoadObject(ofClass: UIImage.self) {
//            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
////                  DispatchQueue.main.async {
////                      self.registerServiceView.personalImage.setBackgroundImage(image as? UIImage, for: .normal)
////                  }
//          }
//        } else {
//            // TODO: 사진 로드 불가능. 에러핸들링 해야 함.
//
//        }
    }
}

extension AddClothViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell()
            
        }
        cell.categoryImage.image = selectedImages[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 200)
    }
    
    
}
