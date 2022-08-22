//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/19.
//

import UIKit

struct Todo {
    var title: String
    var done: Bool
}

class BucketlistTableViewController: UITableViewController {

    static let identifier = "BucketlistTableViewController"
    
    @IBOutlet weak var userTextField: UITextField! {
        didSet {
            userTextField.textAlignment = .center
            userTextField.font = .boldSystemFont(ofSize: 22)
            userTextField.textColor = .red
        }
    }
    
    //list 프로퍼티가 추가, 삭제 등 변경되고 나서 테이블뷰를 항상 갱신
    var list = [Todo(title: "탑건", done: false), Todo(title: "토르", done: false), Todo(title: "a", done: false), Todo(title: "d", done: false), Todo(title: "g", done: false), Todo(title: "h", done: false), Todo(title: "c", done: false), Todo(title: "k", done: false), Todo(title: "z", done: false), Todo(title: "i", done: false), Todo(title: "u", done: false), Todo(title: "x", done: false)] {
        didSet {
            //tableView.reloadData()
        }
    }
    var placeholder: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.placeholder = placeholder == nil ? "" : placeholder!
        

        // 위에 네비게이션바를 설정
        navigationItem.title = "도서"
        //거의 style로 씀
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeBtnClicked))
        
        
        tableView.rowHeight = 80
        
    }
    
    @objc func closeBtnClicked() {
        self.dismiss(animated: true)
    }
    
    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        
//        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) {
//            list.append(value)
//        } else {
//            self.view.makeToast("다시")
//        }
//
//        guard let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) else {
//            // 알럿같은거 추가해도됨
//            return
//        }
        
        
        print(list)
//        list.append(sender.text!)
        list.append(Todo(title: sender.text!, done: false))
        //tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketlistTableViewCell.identifier, for: indexPath) as! BucketlistTableViewCell
        
        cell.bucketlistLabel.text = list[indexPath.row].title
        cell.bucketlistLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        cell.checkboxBtn.tag = indexPath.row
        cell.checkboxBtn.addTarget(self, action: #selector(checkBoxBtnClicked(sender: )), for: .touchUpInside)
        
        let value = list[indexPath.row].done ? "checkmark.square.fill" : "checkmark.square"
        cell.checkboxBtn.setImage(UIImage(systemName: value), for: .normal)
        
        return cell
    }
    
    @objc func checkBoxBtnClicked(sender: UIButton) {
        print("\(sender.tag)번째 버튼 hi")
        
        // 배열 인덱스를 찾아서 done을 바꿔야된다. 그리고 테이블뷰 갱신해야한다.
        list[sender.tag].done = !list[sender.tag].done
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
//
//        sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //배열 삭제후 테이블뷰 갱신
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
}
