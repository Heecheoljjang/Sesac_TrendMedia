//
//  ViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var date2Label: UILabel!
    
    @IBOutlet var dateLabelCollection: [UILabel]!
    
    @IBOutlet weak var secondViewLeadingConstant: NSLayoutConstraint!
    // 변수의 스코프
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondViewLeadingConstant.constant = 120
    }
    
    func configureLabelDesign() {
        //1. OutletCollection
        for i in dateLabelCollection {
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .brown
        }
        //2. UILabel
        let labelArr = [dateLabel, date2Label]
        for i in labelArr {
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .brown
        }
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        let format = DateFormatter()
        format.dateFormat = "yyyy/MM/dd"
        
        dateLabel.text = format.string(from: sender.date)
        
    }
    
}

