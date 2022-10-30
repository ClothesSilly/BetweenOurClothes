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
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
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
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return
//        }
//        windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: RegisterViewController())
//        windowScene.windows.first?.makeKeyAndVisible()
        
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc func startButtonClicked() {
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return
//        }
//        windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: LoginViewController())
//        windowScene.windows.first?.makeKeyAndVisible()
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    
    
}
