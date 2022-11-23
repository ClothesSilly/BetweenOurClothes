//
//  CategoryListViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/11/10.
//

import UIKit
import RxSwift
import RxCocoa

class CategoryListViewController: UIViewController {
    let categoryDict: [Int:[String]] = [1:["브랜드","보세"], 2: ["남자","여자","ㅏ"], 3: ["상의", "하의"], 4:["브랜드","보세"], 5: ["남자","여자"], 6: ["상의", "하의"],7:["브랜드","보세"], 8: ["남자","여자"], 9: ["상의", "하의"],10:["브랜드","보세"], 11: ["남자","여자"], 12: ["상의", "하의"],13:["브랜드","보세"], 14: ["남자","여자"], 15: ["상의", "하의"]]
    
    let disposeBag = DisposeBag()
    let tableView = UITableView()
    
    let nowCategoryNum = PublishRelay<Int>()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: CategoryViewModel){
        //CellData들을 tableView에 뿌려주는 과정 DataSource의 CellForRowAt과 동일한 기능
        viewModel.cellData
            .drive(tableView.rx.items){ tv, row, data in
                
                let cell =
                tv.dequeueReusableCell(withIdentifier: "CategoryListViewCell", for: IndexPath(row: row, section: 0)) as! CategoryListViewCell
            
                cell.setData(data.id, data.name)
               
                return cell
            }
            .disposed(by: disposeBag)
       
       
      
        
        
        viewModel.pop
            .emit(onNext: { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
        //섹션 하나니까 row만 어딘지 알면 됨
            .map{$0.row}
            .bind(to: viewModel.itemSelected)
            .disposed(by: disposeBag)
        
    }
    
    
    private func attribute(){
        view.backgroundColor = .systemBackground
        
        tableView.rowHeight = 70
        tableView.backgroundColor = .white
        tableView.register(CategoryListViewCell.self,
        forCellReuseIdentifier: "CategoryListViewCell")
        
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
    }
    
    private func layout(){
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
