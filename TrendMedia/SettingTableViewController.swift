//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/18.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 4
        } else if section == 2 {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}

