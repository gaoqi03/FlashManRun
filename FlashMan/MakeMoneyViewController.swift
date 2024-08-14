//
//  MakeMoneyViewController.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/10.
//

import Foundation
import UIKit

class MakeMoneyViewController :UIViewController {
    
    override func viewDidLoad() {
        let headViewContoller = MakeMoneyHeaderViewController()
        addChild(headViewContoller)
        view.addSubview(headViewContoller.view)
        headViewContoller.view.translatesAutoresizingMaskIntoConstraints = false

        let adViewContoller = MakeMoneyAdListViewContoller()
        self.addChild(adViewContoller)
        self.view.addSubview(adViewContoller.view)
        adViewContoller.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headViewContoller.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headViewContoller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headViewContoller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headViewContoller.view.heightAnchor.constraint(equalToConstant: 300),

            adViewContoller.view.topAnchor.constraint(equalTo: headViewContoller.view.bottomAnchor),
            adViewContoller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            adViewContoller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            adViewContoller.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

        ])
        
        headViewContoller.didMove(toParent: self)
        adViewContoller.didMove(toParent: self)
    }
}

