//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/19.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    
    var shoppingList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.backgroundColor = .systemGray6
        headerView.layer.cornerRadius = 10
        tableView.tableHeaderView?.frame.size.height = 100
        addBtn.layer.cornerRadius = 10
        addBtn.backgroundColor = .systemGray5
        
    }
    
    @IBAction func tapAddBtn(_ sender: Any) {
        
        if let text = userTextField.text {
            if text != "" {
                shoppingList.append(text)
                tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.checkImg.tintColor = .black
        cell.likeBtn.tintColor = .black
        cell.cellView.backgroundColor = .systemGray6
        cell.cellView.layer.cornerRadius = 10
        cell.listLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
    
        cell.listLabel.text = shoppingList[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //배열 삭제후 테이블뷰 갱신
            shoppingList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
}
