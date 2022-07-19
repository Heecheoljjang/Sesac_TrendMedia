//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/19.
//

import UIKit

struct Movie {
    
    var title: [String] = ["부산행", "7번방의 선물", "겨울왕국", "광해", "괴물", "국제시장", "극한직업", "도둑들", "명량", "베테랑", "신과 함께", "신과 함께2", "아바타", "알라딘"]
    var image: [UIImage?] = [UIImage(named: "0"), UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"), UIImage(named: "7"), UIImage(named: "8"), UIImage(named: "9"), UIImage(named: "10"), UIImage(named: "11"), UIImage(named: "12"), UIImage(named: "13")]
    var date: [String] = ["1234", "2341", "2134", "ㄴㅇㄹㄴ", "ㄴㅇㄹㅂ", "ㅊㅍㄷㅅㄱㅊ", "나러", "345", "6537", "257", "2885", "1345", "362", "36677"]
    var summary: [String] = ["안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕", "안녕", "안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕", "안녕", "안녕", "안녕", "안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕", "안녕", "안녕", "안녕", "안녕", "안녕", "안녕", "안녕", "안녕", "안녕", "안녕", ]
    
}

class SearchTableViewController: UITableViewController {
    
    let movies = Movie()

    override func viewDidLoad() {
        super.viewDidLoad()

        print(movies.title.count)
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.title.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        cell.thumbnailImg.image = movies.image[indexPath.row]
        cell.thumbnailImg.contentMode = .scaleToFill
        cell.titleLabel.text = movies.title[indexPath.row]
        cell.dateLabel.text = movies.date[indexPath.row]
        cell.summaryLabel.text = movies.summary[indexPath.row]
        
        cell.titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        cell.dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        cell.summaryLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(110)
    }

}
