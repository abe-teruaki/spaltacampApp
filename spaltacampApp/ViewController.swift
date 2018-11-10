//
//  ViewController.swift
//  spaltacampApp
//
//  Created by 阿部輝明 on 2018/11/10.
//  Copyright © 2018 阿部輝明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var stickView: UIView!
    @IBOutlet weak var stickLabel: UILabel!
    @IBOutlet weak var stickHeight: NSLayoutConstraint!
    @IBOutlet weak var viewbottomMargin: NSLayoutConstraint!
    
    @IBOutlet weak var overView: UIView!
    @IBOutlet weak var bigLabel: UILabel!
    
    
    let resultTexts: [String] = [
        "大吉"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tapRetryButton(_ sender: Any) {
        
        overView.isHidden = true
        viewbottomMargin.constant = 0
    }
    
    
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        UIView.animate(withDuration: 1.0, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: { (finished: Bool) in
            self.bigLabel.text = self.stickLabel.text
            self.overView.isHidden = false
        })
        
        if motion != UIEvent.EventSubtype.motionShake || overView.isHidden == false  {
            // シェイクモーション以外では動作させない
            return
        }
        
        let resultNum = Int(arc4random_uniform(UInt32(resultTexts.count)))
        stickLabel.text = resultTexts[resultNum]
        viewbottomMargin.constant = stickHeight.constant * +1
        
        UIView.animate(withDuration: 1, animations: {

            self.view.layoutIfNeeded()

        }, completion: { (finished: Bool) in
            // 後ほど記述します。
        })
    }


}

