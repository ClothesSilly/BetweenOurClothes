//
//  WelcomeViewController.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/19.
//

import UIKit


class WelcomeViewController: UIViewController {
    
    let mainView = WelcomeView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        
    }
    

    private func addTargets() {
        mainView.registerButton.addTarget(
            self,
            action: #selector(registerButtonClicked),
            for: .touchUpInside
        )
        
        mainView.startButton.addTarget(
            self,
            action: #selector(startButtonClicked),
            for: .touchUpInside
        )
    }
    
    @objc func registerButtonClicked() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return
        }
        windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: RegisterViewController())
        windowScene.windows.first?.makeKeyAndVisible()
    }
    
    @objc func startButtonClicked() {
        print("ble")
    }
    
    
    
}

