//
//  TaskDetailController.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/11.
//

import Foundation
import UIKit

class TaskDetailController : UIViewController {
    
    var adEntity : AdEntity?
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
        view.backgroundColor = .white
       var label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.text = adEntity?.title
        label.textColor = .white
        
        view.addSubview(label)
        showAlert()
    }
    
    func showAlert(){
        let alertCtl = UIAlertController(title: "hello", message: "welcom", preferredStyle:.alert)
        alertCtl.addAction(UIAlertAction(title: "sure", style: .default,handler: nil))
        present(alertCtl, animated: true, completion: nil)
    }
    
}
