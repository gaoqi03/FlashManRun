//
//  TestUIViewContoller.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/10.
//

import Foundation
import UIKit

class TestUIViewContoller : UIViewController {
    override func viewDidLoad() {
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        
        label.text =  "fuck shen jian"
        
        
        self.view.addSubview(label)
        
    }
}
