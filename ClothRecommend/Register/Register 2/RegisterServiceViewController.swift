//
//  RegisterServiceViewController.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/20.
//

import UIKit
import PhotosUI

import RxSwift
import RxCocoa

final class RegisterServiceViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let registerServiceView = RegisterServiceView()
    
    override func loadView() {
        self.view = registerServiceView
    }
    
    private func configurePicker() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .any(of: [.images])
        
        let pickerViewController = PHPickerViewController(configuration: configuration)
        pickerViewController.delegate = self
    
        self.present(pickerViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerServiceView.personalImage.addTarget(self, action: #selector(selectImageFromGallary), for: .touchUpInside)
        
        
        registerServiceView.finishButton.rx.tap.bind {
            let vc = MainTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }.disposed(by: disposeBag)
    }
    
    override func viewWillLayoutSubviews() {
        registerServiceView.makeImageViewCircular()
    }
    
    
    @objc func selectImageFromGallary() {
        configurePicker()
    }
}


extension RegisterServiceViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        self.dismiss(animated: true, completion: nil)
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                  DispatchQueue.main.async {
                      self.registerServiceView.personalImage.setBackgroundImage(image as? UIImage, for: .normal)
                  }
          }
        } else {
            // TODO: 사진 로드 불가능. 에러핸들링 해야 함.
          
        }
    }
}

