//
//  NewPostViewController.swift
//  ClothRecommend
//
//  Created by 양준식 on 2022/10/29.
//

import UIKit
import RxSwift
import RxCocoa

import CoreML
import ImageIO
import Vision
//import Kingfisher

enum PostEditMode{
    case new
    case edit
}


class NewPostViewController: UIViewController {
    let disposeBag = DisposeBag()
    var postEditMode: PostEditMode = .new
    
    let headerView = UIView()
    let headerLabel = UILabel()
    let tableView = UITableView()
    let submitButton = UIBarButtonItem()
    let footerView = UIView()
    
    let imagePickerController = UIImagePickerController()
    let imagePickButton = UIButton()
    let cameraButton = UIButton()
    let photoImageView = UIImageView()
    let inferResultText = UITextView()
    
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            /*
             Use the Swift class `MobileNet` Core ML generates from the model.
             To use a different Core ML classifier model, add it to the project
             and replace `MobileNet` with that model's generated Swift class.
             */
            let model = try VNCoreMLModel(for: MobileNet().model)
            
            let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                self.inferResultText.text = "Unable to classify image.\n\(error!.localizedDescription)"
                return
            }
            // The `results` will always be `VNClassificationObservation`s, as specified by the Core ML model in this project.
            let classifications = results as! [VNClassificationObservation]
        
            if classifications.isEmpty {
                self.inferResultText.text = "Nothing recognized."
            } else {
                // Display top classifications ranked by confidence in the UI.
                let topClassifications = classifications.prefix(2)
                let descriptions = topClassifications.map { classification in
                    // Formats the classification for display; e.g. "(0.37) cliff, drop, drop-off".
                   return String(format: "  (%.2f) %@", classification.confidence, classification.identifier)
                }
                self.inferResultText.text = "Classification:\n" + descriptions.joined(separator: "\n")
            }
        }
    }
    
    func updateClassifications(for image: UIImage) {
        inferResultText.text = "Classifying..."
        
        let orientation = CGImagePropertyOrientation(rawValue: 1)
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation!)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                /*
                 This handler catches general image processing errors. The `classificationRequest`'s
                 completion handler `processClassifications(_:error:)` catches errors specific
                 to processing that request.
                 */
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    
    init(_ editMode: PostEditMode) {
        super.init(nibName: nil, bundle: nil)
        self.postEditMode = editMode
        imagePickerController.delegate = self
        
        attribute()
        layout()
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEditMode()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(true, animated: true)
//        self.tabBarController?.tabBar.isHidden = true
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(false, animated: true)
//        self.tabBarController?.tabBar.isHidden = false
//    }
    
    func setupEditMode(){
        switch self.postEditMode {
            //받아온 diary 내용들을 일단 화면에 뿌리고, 수정할 수 있게 해야한다
        case let .edit:
            self.headerLabel.text = "글 수정하기"
        default:
            self.headerLabel.text = "새로운 글 작성하기"
        }
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
                    let cell = tv.dequeueReusableCell(withIdentifier: "ClothesImageViewCell", for: IndexPath(row: row, section: 0)) as! ClothesImageViewCell
                    
                    cell.selectionStyle = .none
//                    cell.contentInputView.text = data
//                    cell.bind(viewModel.detailWriteFormCellViewModel)
                    return cell
                    
                case 4:
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
        
        headerLabel.font = .systemFont(ofSize: 20, weight: .bold)
        headerLabel.textColor = .systemPink
//        headerLabel.text = "새로운 글 작성"
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
//        tableView.tableFooterView = footerView
        
        //TableView Register하는 부분 
        //Index row 0
        tableView.register(TitleTextFieldCell.self, forCellReuseIdentifier: "TitleTextFieldCell")
        //index row 1
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategorySelectCell")
        //index row 2
        tableView.register(PriceTextFieldCell.self, forCellReuseIdentifier: "PriceTextFieldCell")
        //index row 3
        tableView.register(ClothesImageViewCell.self, forCellReuseIdentifier: "ClothesImageViewCell")
        //index row 4
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
        photoImageView.image = UIImage(named: "upper")
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func layout(){
        
        view.addSubview(headerView)
        headerView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        headerView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
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
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(50)
            
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
        updateClassifications(for: image)
        
        
//        let model = capstone3()
//        let bb: [[Float]] = [[0,0,0]]
//        let aaa = capstoneInput(input_1: bb)
//
//        guard let yezul = try? model.prediction(input: bb)
//            else{
//
//            }
        
        
        //data image
        
//        let newImage = self.resizeImage(image: image, targetSize: CGSize(width: 32.0, height: 32.0))
        

        
//        var image_data2 = image_data.map{ aa  -> Float32 in
//            let rr = Float32(aa)
//            return rr
//        }
//        guard let capstoneModelOutput = try? capstone.prediction(input: image_data2) else {
//            fatalError("Model Output Error!")
//        }
//        print("____________________-----------_________________")
//        print(capstoneModelOutput, type(of: capstoneModelOutput))
////        inferResultText.text = String(capstoneModelOutput.firstIndex(of: capstoneModelOutput.max()!))
//
//        print(capstoneModelOutput.output)
        
        picker.dismiss(animated: true, completion: nil)
    }
    
   
}
extension CGImagePropertyOrientation {
    /**
     Converts a `UIImageOrientation` to a corresponding
     `CGImagePropertyOrientation`. The cases for each
     orientation are represented by different raw values.
     
     - Tag: ConvertOrientation
     */
    init(_ orientation: UIImage.Orientation) {
        switch orientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        }
    }
}



