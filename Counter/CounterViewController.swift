//
//  ViewController.swift
//  Counter
//
//  Created by Adilkhan on 2/4/26.
//

import UIKit

class CounterViewController: UIViewController {

    @IBOutlet weak private var countLabel: UILabel!
    
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var trashButton: UIButton!
    
    @IBOutlet weak private var historyTextView: UITextView!
    
    private var currentCount: Int = 0
    
    private var history: [String] = []
    
    private let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMM HH:mm:ss"
    }

    
    @IBAction private func plusButtonDidTap() {
        currentCount += 1
        countLabel.text = "\(currentCount)"
        
        history.insert("[\(dateFormatter.string(from: Date()))]: значение изменено на +1", at: 0)
        historyTextView.text = history.joined(separator: "\n")
        
    }
    
    
    @IBAction private func minusButtonDidTap() {
        if currentCount < 1 {
            history.insert("[\(dateFormatter.string(from: Date()))]: попытка уменьшить значение счётчика ниже 0", at: 0)
        } else {
            currentCount -= 1
            countLabel.text = "\(currentCount)"
            
            history.insert("[\(dateFormatter.string(from: Date()))]: значение изменено на -1", at: 0)
        }
        
        historyTextView.text = history.joined(separator: "\n")
    }
    
    @IBAction private func trashButtonDidTap() {
        if currentCount > 0 {
            currentCount = 0
            countLabel.text = "\(currentCount)"
            history.insert("[\(dateFormatter.string(from: Date()))]: значение сброшено", at: 0)
            historyTextView.text = history.joined(separator: "\n")
        }
    }
}

