//
//  ViewController.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        
//        let myLabel = UILabel()
//        
//        myLabel.text = "hello baby !"
//        myLabel.frame.origin = CGPoint(x: 100, y: 100)
//        
//        myLabel.font = UIFont.systemFont(ofSize: 18)
//        myLabel.textColor = UIColor.black
//        myLabel.textAlignment = .center
//        myLabel.numberOfLines = 0
//        myLabel.sizeToFit()
//        
        
//        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector((labelTapped)))
//
//        
//        self.view.addSubview(myLabel)
        
        
        let button = UIButton(type: .system)
        
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        button.backgroundColor = UIColor.blue
        button.setTitle("Click here !", for:.normal)
        
        button.setTitleColor(.white, for:.normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    @objc func buttonTapped(){
        print("button clicked !")
    }

    @objc func labelTapped(){
        print("Label clicked ,tag value is ")
        
    }

}

