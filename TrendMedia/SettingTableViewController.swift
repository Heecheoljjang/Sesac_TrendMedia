//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/18.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case whole, personal, others //섹션
    
    var sectionTitle: String {
        switch self {
        case.whole:
            return "전체 설정"
        case.personal:
            return "개인 설정"
        case.others:
            return "기타"
        }
    }
    
    var rowTitle: [String] {
        switch self {
        case .whole:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["기타"]
        }
    }
}

class SettingTableViewController: UITableViewController {
    
    let whole = ["공지사항", "실험실", "버전 정보"]
    let personal = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let other = ["기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
        
        return SettingOptions.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 3
//        } else if section == 1 {
//            return 4
//        } else if section == 2 {
//            return 1
//        } else {
//            return 0
//        }
        return SettingOptions.allCases[section].rowTitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        
//        if indexPath.section == 0 {
//            cell.textLabel?.text = whole[indexPath.row]
//        } else if indexPath.section == 1 {
//            cell.textLabel?.text = personal[indexPath.row]
//        } else if indexPath.section == 2 {
//            cell.textLabel?.text = other[indexPath.row]
//        }
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].rowTitle[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "전체 설정"
//        } else if section == 1 {
//            return "개인 설정"
//        } else if section == 2 {
//            return "기타"
//        } else {
//            return "없음"
//        }
        return SettingOptions.allCases[section].sectionTitle
    }
}
