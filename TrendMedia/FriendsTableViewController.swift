//
//  FriendsTableViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/19.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var friendName = ["가나다", "바보", "희희", "윤희철", "천재", "짱짱", "다라마", "우영우", "호로호로", "나비", "거북이"]
    var message = ["안녕하세요", "저는", "윤희철", "입니다.", "잘", "부탁드려요", "네네", "반가워요", "하하하", "즐겁게 살자", "iOS짱"]
    var img = [UIImage(named: "0"), UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"), UIImage(named: "7"), UIImage(named: "8"), UIImage(named: "9")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as? FriendsTableViewCell else { return UITableViewCell() }
        
        cell.profileImg.contentMode = .scaleToFill
        cell.profileImg.layer.cornerRadius = 15
        cell.nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        cell.messageLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        cell.messageLabel.textColor = .lightGray
        
        //섹션이 하나기때문에 indexPath.row만으로도 가능
        cell.profileImg.image = img[indexPath.row]
        cell.nameLabel.text = friendName[indexPath.row]
        cell.messageLabel.text = message[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            cell.messageLabel.isHidden = true
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "친구 10"
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
}

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!

}
