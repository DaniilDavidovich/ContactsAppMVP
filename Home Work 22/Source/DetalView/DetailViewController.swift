//
//  DetailViewController.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 31.03.23.
//

import UIKit
import SnapKit


class DetailViewController: UIViewController, DetailPresenterOutput, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    var contact: ContactList? {
        didSet {
            print("Did set: \(contact?.name ?? "error")")
            nameButton.setTitle("\(contact?.name ?? "Error")", for: .normal)
            genderButton.setTitle("\(contact?.gender ?? "Select")", for: .normal)
            datePicker.date = contact?.date ?? Date()
            let image = UIImage(systemName: "photo.circle.fill")
            imageView.image = (UIImage(data: contact?.image ?? Data())) ?? image
        }
    }
    
    var presenter: DetailPresenterInput?
    
    // Bool Flag
    var isEdit = false
        
    //MARK: - UI Elemets
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "photo.circle.fill"))
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .systemGray2
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
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        return label
    }()
    
    private lazy var nameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(pushAllertEdit), for: .touchUpInside)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private lazy var lineLabel: UILabel = {
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
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date:"
        return label
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(giveDate(_:)), for: .valueChanged)
        datePicker.isUserInteractionEnabled = false
        return datePicker
    }()
    
    private lazy var lineLabel2: UILabel = {
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
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender:"
        return label
    }()
    
    private lazy var genderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        let menu = UIMenu(children: allertForMenu())
        button.menu = menu
        button.showsMenuAsPrimaryAction = true
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private lazy var lineLabel3: UILabel = {
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
        let subviews = [imageView, iconImage, nameLabel, nameButton, lineLabel, iconImage2, dateLabel, datePicker, lineLabel2, iconImage3, genderLabel, genderButton, lineLabel3]
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
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImage.snp.centerY)
            make.left.equalTo(iconImage.snp.right).inset(-20)
        }
        
        nameButton.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel)
            make.right.equalTo(view).inset(30)
        }
        
        lineLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).inset(-20)
            make.left.right.equalTo(view).inset(10)
            make.height.equalTo(1)
        }
        
        iconImage2.snp.makeConstraints { make in
            make.top.equalTo(lineLabel.snp.bottom).inset(-20)
            make.left.equalTo(view).inset(10)
            make.width.equalTo(30)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImage2.snp.centerY)
            make.left.equalTo(iconImage2.snp.right).inset(-20)
        }
        
        datePicker.snp.makeConstraints { make in
            make.centerY.equalTo(dateLabel)
            make.right.equalTo(view).inset(30)
        }
        
        lineLabel2.snp.makeConstraints { make in
            make.top.equalTo(iconImage2.snp.bottom).inset(-20)
            make.left.right.equalTo(view).inset(10)
            make.height.equalTo(1)
        }
        
        iconImage3.snp.makeConstraints { make in
            make.top.equalTo(lineLabel2.snp.bottom).inset(-20)
            make.left.equalTo(view).inset(10)
            make.width.equalTo(30)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImage3.snp.centerY)
            make.left.equalTo(iconImage.snp.right).inset(-20)
        }
        
        genderButton.snp.makeConstraints { make in
            make.centerY.equalTo(genderLabel)
            make.right.equalTo(view).inset(30)
        }
        
        lineLabel3.snp.makeConstraints { make in
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
              genderButton.isUserInteractionEnabled = false
              nameButton.isUserInteractionEnabled = false
              imageView.isUserInteractionEnabled = false
              genderButton.setTitleColor(.black, for: .normal)
              nameButton.setTitleColor(.black, for: .normal)
              imageView.tintColor = .systemGray2
              updateName()
              updateDate()
              updateGender()
              isEdit.toggle()
          } else {
              // Если режим не редактирования, меняем кнопку на "Done"
              let editButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editData))
              navigationItem.rightBarButtonItem = editButton
              datePicker.isUserInteractionEnabled = true
              genderButton.isUserInteractionEnabled = true
              nameButton.isUserInteractionEnabled = true
              imageView.isUserInteractionEnabled = true
              genderButton.setTitleColor(.systemBlue, for: .normal)
              nameButton.setTitleColor(.systemBlue, for: .normal)
              imageView.tintColor = .systemBlue
              isEdit.toggle()
          }
    }
    
    @objc private func giveDate(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy" // задаем формат даты
            let selectedDate = dateFormatter.string(from: sender.date)
            print(selectedDate)
    }
    
    @objc private func pushAllertEdit() {
        let allert = UIAlertController(title: "Edit Name", message: "Write New Name", preferredStyle: .alert)
        allert.addTextField()
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            
        }
        
        let done = UIAlertAction(title: "Done", style: .default) { [weak self] _ in
            
            if let newName = allert.textFields?.first?.text, !newName.isEmpty {
                self?.nameButton.setTitle("\(newName)", for: .normal)
            }
        }
        
        allert.textFields?.first?.text = self.contact?.name
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
            guard let imageData = pickedImage.jpegData(compressionQuality: 1.0) else { return }
            self.contact?.image = imageData
            updateImage(newImage: imageData)
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func allertForMenu() -> [UIMenuElement]{
        
        func setupButton(text: String) {
            self.genderButton.setTitle(text, for: .normal)
            self.contact?.gender = text
        }
        
        let maleAction = UIAction(title: "Male") { action in
            setupButton(text: action.title)
        }
        
        let femaleAction = UIAction(title: "Female") { action in
            setupButton(text: action.title)
        }
        
        let nonBinary = UIAction(title: "Non Binary") { action in
            setupButton(text: action.title)
        }
        
        let allerts = [maleAction, femaleAction, nonBinary]
        return allerts
    }
    
    //MARK: - Extension Methods
    
    func updateName() {
        presenter?.updateName(item: self.contact ?? ContactList(),
                                 newName: "\(nameButton.titleLabel?.text ?? "Empty")")
    }
    
    func updateGender() {
        presenter?.updateGender(item: self.contact ?? ContactList(),
                                   newGender: "\(genderButton.titleLabel?.text ?? "Empty")")
    }
    
    func updateDate() {
        presenter?.updateDate(item: self.contact ?? ContactList(),
                                 newDate: datePicker.date)
    }
    
    func updateImage(newImage: Data) {
        presenter?.updateImage(item: self.contact ?? ContactList(), newImage: newImage)
    }
}
