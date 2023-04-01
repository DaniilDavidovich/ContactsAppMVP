//
//  DetailViewController.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 31.03.23.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController  {
    
    var item = ContactList()
    
    func setupImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    //MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.fill"))
        imageView.backgroundColor = .systemGray6
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detail cell")
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.allowsSelection = false
        return tableView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        
        
        return label
    }()
    
    //MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Contact"
        let addButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
    }
    
    //MARK: - Methods
    
    private func setupImageViewForCell(cell: UITableViewCell) {
        cell.contentView.addSubview(self.imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalTo(cell.contentView)
            make.width.height.equalTo(150)
        }
    }
    
    @objc private func addButtonTapped() {
        if !tableView.allowsSelection {
            tableView.allowsSelection = true
            let addButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addButtonTapped))
            navigationItem.rightBarButtonItem = addButton
        } else {
            tableView.allowsSelection = false
            let addButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(addButtonTapped))
            navigationItem.rightBarButtonItem = addButton
            
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detail cell", for: indexPath)
        switch indexPath.row {
        case 0:
            self.setupImageViewForCell(cell: cell)
        case 1:
            cell.textLabel?.text = item.name
        case 2:
            cell.textLabel?.text = item.name
        case 3:
            cell.textLabel?.text = item.gender ?? "Gender"
        default: break
        }
        
        // запрещено нажимать
//        cell.isUserInteractionEnabled = false

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            setupImagePicker()
        case 1:
            
        case 2:
            
        case 3:
            
        default: break
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 350
        } else {
            return 60
        }
    }
}

extension DetailViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
}

