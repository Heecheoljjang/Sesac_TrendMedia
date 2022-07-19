//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/18.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var birthdayFriends = ["ㅇㅇㅇㅇ", "ㄴㄴㄴㄴㄴ", "ㅃㅃㅃㅃㅂ", "ㅊㅊㅊㅊㅊㅊ", "ㅁㅁㅁㅁㅁㅁ","ㅋㅋㅋㅋㅋ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 80 // 기본 44
        
    }
    
    //섹션의 개수(옵션)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "생일인 친구"
        } else if section == 1 {
            return "hoho"
        } else if section == 2 {
            return "babo"
        } else {
            return "oo"
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "456"
    }
    // 1. 셀의 개수
    // ex. 카톡 100명이면 셀 100개, 3000명이면 셀 3000개 같이 몇 개 필요한지 알려주는 함수 필요
    // 매개변수 두개, 반환 값은 Int -> 셀의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return birthdayFriends.count
        } else if section == 1 {
            return 4
        } else if section == 2 {
            return 3
        } else {
            return 10
        }
    }
    
    
    // 2. 셀의 디자인과 데이터(필수)
    // ex. 카톡 이름, 프로필 사진, 상태 메세지 등
    
    // 재사용 메커니즘과 연결
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowAt", indexPath)
        
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell")!
            cell.textLabel?.text = "aaaa"
            cell.textLabel?.textColor = .gray
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            cell.detailTextLabel?.text = "detailLabelYOYO"
            
            // 삼항연산자 사용
            //indexPath.row % 2에 따라 조건 다르게 하기
//            if indexPath.row % 2 == 0 {
//                cell.imageView?.image = UIImage(systemName: "pencil")
//                cell.backgroundColor = .lightGray
//            } else {
//                cell.imageView?.image = UIImage(systemName: "star")
//                cell.backgroundColor = .blue
//            }
            cell.imageView?.image = indexPath.row % 2 == 0 ? UIImage(systemName: "pencil") : UIImage(systemName: "star")
            cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .blue

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
            if indexPath.section == 0 {
                cell.textLabel?.text = birthdayFriends[indexPath.row]
                cell.textLabel?.textColor = .tintColor
                cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            } else if indexPath.section == 1 {
                cell.textLabel?.text = "ddd"
                cell.textLabel?.textColor = .systemMint
                cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            }
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
//        if indexPath.section == 0 {
//            if indexPath.row == 0 {
//                return 150
//            }
//        }
        
        return 100
    }
}
