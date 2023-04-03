//
//  DetailViewController.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 31.03.23.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController  {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "photo.circle.fill"))
        imageView.contentMode = .scaleAspectFill
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
    
    private lazy var labelNameData: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textAlignment = .right
        
        return label
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
    
    private lazy var labelGenderData: UILabel = {
        let label = UILabel()
        label.text = "Select"
        label.textAlignment = .right
        return label
    }()
    
    private lazy var labelLine3: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray4
        label.layer.cornerRadius = 20
        
        return label
    }()
    
//    var item = ContactList()
    
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .edit)
    }
    
    func setupHierarchy() {
        let subviews = [imageView, iconImage, labelName, labelNameData, labelLine, iconImage2, labelDate, datePicker, labelLine2, iconImage3, labelGender, labelGenderData, labelLine3]
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
        
        labelNameData.snp.makeConstraints { make in
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
        
        labelGenderData.snp.makeConstraints { make in
            make.centerY.equalTo(labelGender)
            make.right.equalTo(view).inset(30)
        }
        
        labelLine3.snp.makeConstraints { make in
            make.top.equalTo(iconImage3.snp.bottom).inset(-20)
            make.left.right.equalTo(view).inset(10)
            make.height.equalTo(1)
        }
    }
    
}
