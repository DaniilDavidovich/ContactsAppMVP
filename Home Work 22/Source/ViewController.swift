//
//  ViewController.swift
//  Home Work 22
//
//  Created by Daniil Davidovich on 31.03.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var models = [ContactList]()
    
    //MARK: - Outlets
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Print Yout Name Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.textAlignment = .left
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    private lazy var button: UIButton = {
        let action = UIAction(title: "Tap me") { _ in
            guard let text = self.textField.text, !text.isEmpty else { return }
            self.createItem(name: text)
            print(text)
        }
        let button = UIButton(type: .system, primaryAction: action)
        button.setTitle("Press", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        button.setTitleColor(UIColor.white, for: .normal)
        
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    //MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        getAllItems()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(view).inset(160)
            make.left.right.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).inset(-10)
            make.left.right.equalTo(textField)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(button.snp.bottom).inset(-20)
        }
    }
    
    //MARK: - Methods
    
    // for Dismis keyboard
    func hideKeyboardWhenTappedAround() {

    let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
    view.endEditing(true)
    }
    
    //MARK: - Core Data

    func getAllItems() {
        do {
            models = try context.fetch(ContactList.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
           
        } catch {
            print("Error")
        }
    }
    
    func createItem(name: String) {
        let newItem = ContactList(context: context)
        newItem.name = name
        newItem.date = Date()
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
    
    func deleteItem(item: ContactList) {
        context.delete(item)
       
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
    
    func updateItem(item: ContactList, newName: String) {
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print("error save")
        }
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .default
        let item = models[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = models[indexPath.row]
        let detailView = DetailViewController()
        detailView.item = item
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            deleteItem(item: models[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}




