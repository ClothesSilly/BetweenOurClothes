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
    let disposeBag = DisposeBag()
    let tableView = UITableView()
    
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
                tv.dequeueReusableCell(withIdentifier: "CategoryListViewCell", for: IndexPath(row: row, section: 0))
                //cell.categoryTitleButton?.titleLabel.text = data.name
                //cell.textLabel?.text = data.name
                //cell.textLabel?.text = data.name
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
        
        tableView.rowHeight = 200
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
