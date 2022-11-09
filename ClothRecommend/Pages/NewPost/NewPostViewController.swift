//
//  NewPostViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//


import UIKit
import RxSwift
import RxCocoa
//import Kingfisher



class NewPostViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    
    let tableView = UITableView()
    let submitButton = UIBarButtonItem()
    
    let footerView = UIView()
    let imagePickerController = UIImagePickerController()
    let imagePickButton = UIButton()
    let cameraButton = UIButton()
    let photoImageView = UIImageView()
    let inferResultText = UITextField()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        imagePickerController.delegate = self
        
        attribute()
        layout()
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: NewPostViewModel){
        viewModel.cellData
            .drive(tableView.rx.items){ tv, row, data in
                switch row {
                case 0:
                    let cell = tv.dequeueReusableCell(withIdentifier: "TitleTextFieldCell", for: IndexPath(row: row, section: 0)) as! TitleTextFieldCell
                    
                    cell.selectionStyle = .none
                    cell.titleInputField.placeholder = data
                    cell.bind(viewModel.titleTextFieldCellViewModel)
                    return cell
                case 1:
                    let cell = tv.dequeueReusableCell(withIdentifier: "CategorySelectCell", for: IndexPath(row: row, section: 0))
                    
                    cell.selectionStyle = .none
                    cell.textLabel?.text = data
                    cell.accessoryType = .disclosureIndicator
                    return cell
                
                case 2:
                    let cell = tv.dequeueReusableCell(withIdentifier: "PriceTextFieldCell", for: IndexPath(row: row, section: 0)) as! PriceTextFieldCell
                    
                    cell.selectionStyle = .none
                    cell.priceInputField.placeholder = data
                    cell.bind(viewModel.priceTextFieldCellViewModel)
                    return cell
                    
                case 3:
                    let cell = tv.dequeueReusableCell(withIdentifier: "DetailWriteFormCell", for: IndexPath(row: row, section: 0)) as! DetailWriteFormCell
                    
                    cell.selectionStyle = .none
                    cell.contentInputView.text = data
                    cell.bind(viewModel.detailWriteFormCellViewModel)
                    return cell
                    
                default:
                    fatalError()
                }
            }.disposed(by: disposeBag)
        
        viewModel.presentAlert
            .emit(to: self.rx.setAlert)
            .disposed(by: disposeBag)
        
        viewModel.push
            .drive(onNext: { viewModel in
                let viewController = CategoryListViewController()
                viewController.bind(viewModel)
                self.show(viewController, sender: nil)
            }).disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .map{ $0.row }
            .bind(to: viewModel.itemSelected)
            .disposed(by: disposeBag)
        
        submitButton.rx.tap
            .bind(to: viewModel.submitButtonTapped)
            .disposed(by: disposeBag)
        
    }
    private func attribute(){
        title = "새로운 글 작성"
        view.backgroundColor = .white
        
        submitButton.title = "제출"
        submitButton.style = .done
        
        navigationItem.setRightBarButton(submitButton, animated: true)
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
//        tableView.tableFooterView = footerView
        
        //Index row 0
        tableView.register(TitleTextFieldCell.self, forCellReuseIdentifier: "TitleTextFieldCell")
        //index row 1
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategorySelectCell")
        //index row 2
        tableView.register(PriceTextFieldCell.self, forCellReuseIdentifier: "PriceTextFieldCell")
        //index row 3
        tableView.register(DetailWriteFormCell.self, forCellReuseIdentifier: "DetailWriteFormCell")
        
        
        
        imagePickButton.backgroundColor = .green
        imagePickButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        imagePickButton.isEnabled = true
        cameraButton.backgroundColor = .blue
        cameraButton.addTarget(self, action: #selector(cameraImage), for: .touchUpInside)
        cameraButton.isEnabled = true
        inferResultText.backgroundColor = .yellow
        inferResultText.textColor = .black
        inferResultText.text = "추론값 test"
        photoImageView.image = UIImage(systemName: "photo")
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func layout(){
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(100)
        }
        view.addSubview(footerView)
        footerView.snp.makeConstraints{
            $0.top.equalTo(tableView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        [imagePickButton,cameraButton, photoImageView, inferResultText].forEach{
            footerView.addSubview($0)
        }
        imagePickButton.snp.makeConstraints{
                $0.leading.top.equalToSuperview().inset(2)
                $0.width.height.equalTo(30)
            }
        cameraButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(2)
            $0.top.equalTo(imagePickButton.snp.bottom).offset(4)
            $0.width.height.equalTo(30)
        }
        photoImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(2)
            $0.leading.equalTo(imagePickButton.snp.trailing).offset(2)
            $0.width.height.equalTo(50)
        }
        inferResultText.snp.makeConstraints{
            $0.top.equalToSuperview().inset(2)
            $0.leading.equalTo(photoImageView.snp.trailing).offset(2)
            
        }
    
    }
}


typealias Alert = (title: String, message: String?)

extension Reactive where Base: NewPostViewController {
    var setAlert: Binder<Alert>{
        return Binder(base) { base, data in
            let alertController = UIAlertController(title: data.title, message: data.message, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alertController.addAction(action)
            base.present(alertController, animated: true, completion: nil)
        }
    }
}

extension NewPostViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    //갤러리 접근
    @objc private func pickImage(_ sender: Any) {
        debugPrint("버튼클릭d")
        self.imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
        
    }
    //카메라 접근
    @objc private func cameraImage(_ sender: Any) {
        debugPrint("버튼클릭a")
        self.imagePickerController.sourceType = .camera
        self.imagePickerController.mediaTypes = ["public.image"]
        
        self.present(imagePickerController, animated: true, completion: nil)
        
    }
    //갤러리에서 이미지 선택 후 호출됨
    // 가져온 이미지를 UIImage로 변환, photoImageVIew의 이미지로 넣어줌
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
//        if let image = info[UIImagePickerController.InfoKey.originalImage]{
//            photoImageView.image = image as! UIImage
//        }
//        dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
              picker.dismiss(animated: true)
              return
            }
        self.photoImageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
}


