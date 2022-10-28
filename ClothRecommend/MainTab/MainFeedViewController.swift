//
//  ViewController.swift
//  ClothRecommend
//
//  Created by Yundong Lee on 2022/09/14.
//

import UIKit

class MainFeedViewController: UIViewController {
    
    let mainFeedView = MainFeedView()

    override func loadView() {
        self.view = mainFeedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainFeedView.mainFeedTableView.delegate = self
        mainFeedView.mainFeedTableView.dataSource = self
    }
}

extension MainFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainFeedTableViewCell.identifier, for: indexPath) as? MainFeedTableViewCell else { return UITableViewCell()
            
        }
        
        cell.userName.text = "hello world"
        cell.userImage.image = UIImage(named: "dummyUser")
        cell.mainImage.image = UIImage(named: "dog")
        
        return cell
    }
}

