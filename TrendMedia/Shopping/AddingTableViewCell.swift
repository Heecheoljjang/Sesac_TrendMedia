//
//  AddingTableViewCell.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/19.
//

import UIKit

class AddingTableViewCell: UITableViewCell {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    
    @IBAction func tapAddBtn(_ sender: UIButton) {
        
        let vc = ShoppingTableViewController()
        
        if let text = searchTextField.text {
            if text != "" {
                vc.shoppingList.append(text)
                vc.tableView.reloadData()
            }
        }
    }
    
}
