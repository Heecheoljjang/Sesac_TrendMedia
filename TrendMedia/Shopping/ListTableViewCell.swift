//
//  ShoppingTableViewCell.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/19.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    static let identity = "ListTableViewCell"
    
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        cellView.backgroundColor = .systemGray6
        cellView.layer.cornerRadius = 10
        listLabel.font = .systemFont(ofSize: 13, weight: .regular)
    }

}
