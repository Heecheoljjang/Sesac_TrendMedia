//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/19.
//

import UIKit
import PhotosUI
import RealmSwift

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    
    //var shoppingList: [ShoppingModel] = []
    var tasks: Results<ShoppingList>!
    
    let localRealm = try! Realm()
    
    var pickedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.backgroundColor = .systemGray6
        headerView.layer.cornerRadius = 10
        tableView.tableHeaderView?.frame.size.height = 100
        addBtn.layer.cornerRadius = 10
        addBtn.backgroundColor = .systemGray5
        
        tasks = localRealm.objects(ShoppingList.self)
        
        let menuItems: [UIAction] = [
            UIAction(title: "글자 순 정렬", image: nil, identifier: nil, discoverabilityTitle: nil, handler: { action in
                self.tasks = self.localRealm.objects(ShoppingList.self).sorted(byKeyPath: "content", ascending: true)
                self.tableView.reloadData()
            }), UIAction(title: "완료", image: nil, identifier: nil, discoverabilityTitle: nil, handler: { action in
                self.tasks = self.localRealm.objects(ShoppingList.self).where {
                    $0.isChecked == true
                }
                self.tableView.reloadData()

            }),UIAction(title: "즐겨찾기", image: nil, identifier: nil, discoverabilityTitle: nil, handler: { action in
                self.tasks = self.localRealm.objects(ShoppingList.self).where {
                    $0.isLiked == true
                }
                self.tableView.reloadData()

            })
        ]
        
        let menu = UIMenu(identifier: nil, options: .displayInline, children: menuItems)
        
        let button = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), primaryAction: nil, menu: menu)
        
        navigationItem.leftBarButtonItem = button
        
        let imagePickButton = UIBarButtonItem(image: UIImage(systemName: "photo"), style: .plain, target: self, action: #selector(presentImagePicker))
        
        navigationItem.rightBarButtonItem = imagePickButton
        
    }
    
    @objc func presentImagePicker() {
    
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .any(of: [.images])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
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
                
                guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
                
                let fileURL = documentDirectory.appendingPathComponent("\(task.objectID).jpg")
                guard let data = self.pickedImage?.jpegData(compressionQuality: 0.3) else { return }
                
                do {
                    try data.write(to: fileURL)
                } catch let error {
                    print(error)
                }
        
                tableView.reloadData()
            }
        }
        userTextField.text = ""
        pickedImage = nil
    }
    
    func loadImageFromDocument(fileName: String) -> UIImage? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil } //document 경로까지 가져오는것
        let fileURL = documentDirectory.appendingPathComponent(fileName) //세부경로
        // url에 이미지가 존재하는지 확인 후 없으면 기본이미지
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path)
        } else {
            return UIImage(systemName: "star.fill")
        }
    }
    
    func removeImageFromDocument(fileName: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return } //document 경로까지 가져오는것
        let fileURL = documentDirectory.appendingPathComponent(fileName) //세부경로
        
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch let error {
            print(error)
        }
    }
    
    func saveImageToDocument(fileName: String, image: UIImage) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return } //document 경로까지 가져오는것
        let fileURL = documentDirectory.appendingPathComponent(fileName) //세부경로. 즉, /Documents/fileName 이미지를 저장할 위치
        guard let data = image.jpegData(compressionQuality: 0.5) else { return } //압축
        
        do {
            try data.write(to: fileURL) // try 저장될때가지 쭉 시도함 -> 다른 코드들보다 우선순위 두는 느낌
        } catch let error {
            print("저장 실패", error)
        }
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
        
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return UITableViewCell() } //document 경로까지 가져오는것
        let fileURL = documentDirectory.appendingPathComponent("\(tasks[indexPath.row].objectID).jpg") //세부경로
        if FileManager.default.fileExists(atPath: fileURL.path) {
            cell.myImageView.image = UIImage(contentsOfFile: fileURL.path)
        } else {
            cell.myImageView.image = UIImage(systemName: "star.fill")
        }
        
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
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: nil) { action, view, completionHandler in
            //리스트에서 지우기
            try! self.localRealm.write {
                self.localRealm.delete(self.tasks[indexPath.row])
            }
            self.tableView.reloadData()
        }
        delete.image = UIImage(systemName: "trash")
        
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return UISwipeActionsConfiguration(actions: [])} //document 경로까지 가져오는것
        let fileURL = documentDirectory.appendingPathComponent("\(tasks[indexPath.row].objectID).jpg") //세부경로
        
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch let error {
            print(error)
        }
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
}

extension ShoppingTableViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        let itemProvider =  results.first?.itemProvider
        
        itemProvider?.loadObject(ofClass: UIImage.self) { image, error in
            let image = image as? UIImage
            self.pickedImage = image
        }
    }
}
