//
//  AddClothViewController.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/16.
//

import UIKit
import PhotosUI

class AddClothViewController: UIViewController {
    
    let addClothView = AddClothView()
    var selectedImages: [UIImage] = []
    
    override func loadView() {
        self.view = addClothView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addClothView.selectedImageCollectionView.delegate = self
        addClothView.selectedImageCollectionView.dataSource = self
        
        
        addClothView.selectPhoto.addTarget(self, action: #selector(showPhotoPicker), for: .touchUpInside)
        addClothView.sumbitButton.addTarget(self, action: #selector(savePhoto), for: .touchUpInside)
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
        print("photos saved")
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
//            // TODO: ?????? ?????? ?????????. ??????????????? ?????? ???.
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
