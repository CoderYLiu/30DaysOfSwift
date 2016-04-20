//
//  ViewController.swift
//  EmojiMachine <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/20.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var emojiPickerView: UIPickerView!
    
    @IBOutlet weak var goButton: UIButton!

    @IBOutlet weak var resultLabel: UILabel!
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds: CGRect = CGRectZero
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bounds = goButton.bounds
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for (var i = 0; i < 100; i++) {
            dataArray1.append((Int)(arc4random() % 10 ))
            dataArray2.append((Int)(arc4random() % 10 ))
            dataArray3.append((Int)(arc4random() % 10 ))
        }
        
        resultLabel.text = ""
    
        goButton.layer.cornerRadius = 6
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        goButton.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: {
            
            self.goButton.alpha = 1
            
            }, completion: nil)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    var test = 1
    
    @IBAction func goButtoDidClick(sender: AnyObject) {
        
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 0, animated: true)
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 1, animated: true)
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 2, animated: true)
        
        if(dataArray1[emojiPickerView.selectedRowInComponent(0)] == dataArray2[emojiPickerView.selectedRowInComponent(1)] && dataArray2[emojiPickerView.selectedRowInComponent(1)] == dataArray3[emojiPickerView.selectedRowInComponent(2)]) {
            
            resultLabel.text = "Bingo!"
            
        } else {
            
            resultLabel.text = "💔"
            
        }
        
        
        // animate
        
        goButton.transform = CGAffineTransformMakeScale(0.0, 0.0)
        UIView.animateWithDuration(1.25, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
            self.goButton.transform = CGAffineTransformIdentity
            }, completion: { (_) -> Void in
                self.goButton.userInteractionEnabled = true
        })
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        } else if component == 1 {
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        } else {
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        return pickerLabel
        
    }

}

