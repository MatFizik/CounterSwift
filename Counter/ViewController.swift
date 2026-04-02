//
//  ViewController.swift
//  Counter
//
//  Created by Adilkhan on 2/4/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    var currentCount: Int = 0
    
    var history: [String] = []
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMM HH:mm:ss"
    }

    
    @IBAction func plusButtonDidTap() {
        currentCount += 1
        countLabel.text = "\(currentCount)"
        
        history.append("[\(dateFormatter.string(from: Date()))]: значение изменено на +1")
        historyTextView.text = history.joined(separator: "\n")
        
    }
    
    
    @IBAction func minusButtonDidTap() {
        currentCount -= 1
        countLabel.text = "\(currentCount)"
        
        history.append("[\(dateFormatter.string(from: Date()))]: значение изменено на -1")
        historyTextView.text = history.joined(separator: "\n")
        
    }
}

