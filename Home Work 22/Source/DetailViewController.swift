//
//  DetailViewController.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 31.03.23.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var item: ContactList? {
        didSet {
            label.text = item?.name
        }
    }
    
    //MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "heart"))
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detail cell")
        tableView.dataSource = self
        tableView.delegate = self
        
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
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
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
            cell.imageView?.image = UIImage(systemName: "heart")
        case 1:
            cell.textLabel?.text = "Gender"
        case 2:
            cell.textLabel?.text = "Gender"
        case 3:
            cell.textLabel?.text = "Gender"
        default: break
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    
}

