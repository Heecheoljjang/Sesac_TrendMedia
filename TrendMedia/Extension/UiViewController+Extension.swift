//
//  UiViewController+Extension.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/19.
//

import UIKit

extension UIViewController {
    
    func setBackgroundColor() {
        
        view.backgroundColor = .orange
        
    }
    
    func showAlert(title: String) {
        
        let alert = UIAlertController(title: title, message: "ㅇㅇㅇ", preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    
}
