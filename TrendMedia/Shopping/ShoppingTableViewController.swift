//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/19.
//

import UIKit

import RealmSwift

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    
    //var shoppingList: [ShoppingModel] = []
    var tasks: Results<ShoppingList>!
    
    let localRealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.backgroundColor = .systemGray6
        headerView.layer.cornerRadius = 10
        tableView.tableHeaderView?.frame.size.height = 100
        addBtn.layer.cornerRadius = 10
        addBtn.backgroundColor = .systemGray5
        
        tasks = localRealm.objects(ShoppingList.self)
        
    }
    
    @IBAction func tapAddBtn(_ sender: Any) {
        
        if let text = userTextField.text {
            if text != "" {
                //shoppingList.append(ShoppingModel(content: text))
                let task = ShoppingList(content: text)
                
                try! localRealm.write {
                    localRealm.add(task) //실질적으로 create
                    print("succeed", localRealm.configuration.fileURL!)
                }
                tasks = localRealm.objects(ShoppingList.self)
                tableView.reloadData()
            }
        }
        userTextField.text = ""
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identity, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.likeBtn.tag = indexPath.row
        cell.checkButton.tag = indexPath.row
        
        cell.likeBtn.addTarget(self, action: #selector(tapLikeButton(_:)), for: .touchUpInside)
        cell.checkButton.addTarget(self, action: #selector(tapCheckButton(_:)), for: .touchUpInside)
        
        cell.listLabel.text = tasks[indexPath.row].content
        
        tasks[indexPath.row].isChecked ? cell.checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal) : cell.checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        tasks[indexPath.row].isLiked ? cell.likeBtn.setImage(UIImage(systemName: "star.fill"), for: .normal) : cell.likeBtn.setImage(UIImage(systemName: "star"), for: .normal)
        
        return cell
    }
    
    @objc func tapLikeButton(_ sender: UIButton) {
        let taskToUpdate = tasks[sender.tag]
        try! localRealm.write {
            taskToUpdate.isLiked = !taskToUpdate.isLiked
        }
        tableView.reloadData()
    }
    
    @objc func tapCheckButton(_ sender: UIButton) {
        let taskToUpdate = tasks[sender.tag]
        try! localRealm.write {
            taskToUpdate.isChecked = !taskToUpdate.isChecked
        }
        tableView.reloadData()
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
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            //배열 삭제후 테이블뷰 갱신
//            tasks.remove(at: indexPath.row)
//            tableView.reloadData()
//        }
//    }
    
    
}
