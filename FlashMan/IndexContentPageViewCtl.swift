//
//  HomePageView.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/4.
//

import Foundation
import UIKit

class HomeContentPageViewCtl :UIViewController{
   
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
             ])
        titleLabel.text = pageTitle
             
    }
    
}
