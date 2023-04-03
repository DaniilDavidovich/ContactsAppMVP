//
//  DetailViewController.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 31.03.23.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController  {
    
    var item: ContactList? {
        didSet {
            buttonName.setTitle("\(item?.name ?? "Error")", for: .normal)
        }
    }
    
    var isEdit = false
    
    //MARK: - UI Elemets
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "photo.circle.fill"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 100
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        imageView.isUserInteractionEnabled = false
        imageView.addGestureRecognizer(tapGesture)
        
        return imageView
    }()
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        return label
    }()
    
    private lazy var buttonName: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(pushAllertEdit), for: .touchUpInside)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private lazy var labelLine: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray4
        label.layer.cornerRadius = 20
        return label
    }()
    
    private lazy var iconImage2: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "calendar"))
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var labelDate: UILabel = {
        let label = UILabel()
        label.text = "Date:"
        return label
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.isUserInteractionEnabled = false
        return datePicker
    }()
    
    private lazy var labelLine2: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray4
        label.layer.cornerRadius = 20
        
        return label
    }()
    
    private lazy var iconImage3: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.2.circle"))
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var labelGender: UILabel = {
        let label = UILabel()
        label.text = "Gender:"
        return label
    }()
    
    private lazy var buttonGender: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitle("Select", for: .normal)
        
        let maleAction = UIAction(title: "Male") { _ in
            print("Male selected")
        }
        let femaleAction = UIAction(title: "Female") { _ in
            print("Female selected")
        }
        
        let nonBinary = UIAction(title: "Non Binary") { _ in
            print("Non - binary selected")
        }
        
        let menu = UIMenu(children: [maleAction, femaleAction, nonBinary])

        button.menu = menu
        button.showsMenuAsPrimaryAction = true
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private lazy var labelLine3: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray4
        label.layer.cornerRadius = 20
        return label
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Setups
    
    func setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Contact"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editData))
    }
    
    func setupHierarchy() {
        let subviews = [imageView, iconImage, labelName, buttonName, labelLine, iconImage2, labelDate, datePicker, labelLine2, iconImage3, labelGender, buttonGender, labelLine3]
        let _ = subviews.map { view in
            self.view.addSubview(view)
        }
    }
    
    func setupLayout() {
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(230)
            make.centerX.equalTo(view)
            make.width.height.equalTo(200)
        }
        
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-100)
            make.left.equalTo(view).inset(10)
            make.width.equalTo(30)
        }
        
        labelName.snp.makeConstraints { make in
            make.centerY.equalTo(iconImage.snp.centerY)
            make.left.equalTo(iconImage.snp.right).inset(-20)
        }
        
        buttonName.snp.makeConstraints { make in
            make.centerY.equalTo(labelName)
            make.right.equalTo(view).inset(30)
        }
        
        labelLine.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).inset(-20)
            make.left.right.equalTo(view).inset(10)
            make.height.equalTo(1)
        }
        
        iconImage2.snp.makeConstraints { make in
            make.top.equalTo(labelLine.snp.bottom).inset(-20)
            make.left.equalTo(view).inset(10)
            make.width.equalTo(30)
        }
        
        labelDate.snp.makeConstraints { make in
            make.centerY.equalTo(iconImage2.snp.centerY)
            make.left.equalTo(iconImage2.snp.right).inset(-20)
        }
        
        datePicker.snp.makeConstraints { make in
            make.centerY.equalTo(labelDate)
            make.right.equalTo(view).inset(30)
        }
        
        labelLine2.snp.makeConstraints { make in
            make.top.equalTo(iconImage2.snp.bottom).inset(-20)
            make.left.right.equalTo(view).inset(10)
            make.height.equalTo(1)
        }
        
        iconImage3.snp.makeConstraints { make in
            make.top.equalTo(labelLine2.snp.bottom).inset(-20)
            make.left.equalTo(view).inset(10)
            make.width.equalTo(30)
        }
        
        labelGender.snp.makeConstraints { make in
            make.centerY.equalTo(iconImage3.snp.centerY)
            make.left.equalTo(iconImage.snp.right).inset(-20)
        }
        
        buttonGender.snp.makeConstraints { make in
            make.centerY.equalTo(labelGender)
            make.right.equalTo(view).inset(30)
        }
        
        labelLine3.snp.makeConstraints { make in
            make.top.equalTo(iconImage3.snp.bottom).inset(-20)
            make.left.right.equalTo(view).inset(10)
            make.height.equalTo(1)
        }
    }
    
    //MARK: - @objc Methods
    
    @objc private func editData() {
          if isEdit {
              // Если режим редактирования, меняем кнопку на "Edit"
              let doneButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editData))
              navigationItem.rightBarButtonItem = doneButton
              datePicker.isUserInteractionEnabled = false
              buttonGender.isUserInteractionEnabled = false
              buttonName.isUserInteractionEnabled = false
              imageView.isUserInteractionEnabled = false
              isEdit.toggle()
          } else {
              // Если режим не редактирования, меняем кнопку на "Done"
              let editButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editData))
              navigationItem.rightBarButtonItem = editButton
              datePicker.isUserInteractionEnabled = true
              buttonGender.isUserInteractionEnabled = true
              buttonName.isUserInteractionEnabled = true
              imageView.isUserInteractionEnabled = true
              isEdit.toggle()
          }
    }
    
    @objc private func pushAllertEdit() {
        let allert = UIAlertController(title: "Edit Name", message: "Write New Name", preferredStyle: .alert)
        allert.addTextField()
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            
        }
        let done = UIAlertAction(title: "Done", style: .cancel) { _ in
            
        }
        allert.addAction(done)
        allert.addAction(cancel)
        present(allert, animated: true)
    }
    
    @objc private func imageViewTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary // источник - библиотека фотографий
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: - Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
}
