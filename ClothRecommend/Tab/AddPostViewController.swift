//
//  AddPostViewController.swift
//  ClothRecommend
//
//  Created by USER on 2022/10/01.
//

import UIKit


class AddPostViewController: UIViewController {
    
    let addPostView = AddPostView()
    
    override func loadView() {
        self.view = addPostView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPostView.tableView.delegate = self
        addPostView.tableView.dataSource = self
        
    }
    
}

extension AddPostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddPostCell.identifier, for: indexPath) as? AddPostCell else { return UITableViewCell() }
    
        cell.title.text = "hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let vc = AddClothViewController()
            present(vc, animated: true)
        }
    }
    
}

