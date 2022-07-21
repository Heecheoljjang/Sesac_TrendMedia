//
//  SearchTableViewCell.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/19.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identity = "SearchTableViewCell"
    
    @IBOutlet weak var thumbnailImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    func configureCell(data: Movie) {
        
        //thumbnailImg.contentMode = .scaleToFill
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        summaryLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
        //thumbnailImg.image = movies.image[indexPath]
        titleLabel.text = data.title
        dateLabel.text = "\(data.releaseDate) | \(data.runtime)분 | \(data.rate)점"
        summaryLabel.text = data.overview
    }
    
}
