//
//  MakeMoneyHeaderViewController.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/10.
//

import Foundation
import UIKit

class MakeMoneyHeaderViewController : UIViewController {
    
    override func viewDidLoad() {
        
        // 创建一个堆栈视图，用于水平排列子视图
        let stackView = UIStackView()
        stackView.axis = .horizontal // 水平排列
        stackView.distribution = .fillEqually // 子视图均分空间
        stackView.spacing = 10 // 子视图之间的间距
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        
        // 创建三个子控件
        let leftView = UILabel()
        leftView.text = "提现记录"
        let centerView = UILabel()
        centerView.text = "趣走走"
        centerView.font = UIFont.systemFont(ofSize: 24)
        let rightView = UILabel()
        rightView.text = "加群"
        rightView.textAlignment = .right
        // 将子控件添加到堆栈视图
        stackView.addArrangedSubview(leftView)
        stackView.addArrangedSubview(centerView)
        stackView.addArrangedSubview(rightView)
        
        // 将堆栈视图添加到父视图
        view.addSubview(stackView)
        
        // 设置堆栈视图的约束
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 50) // 设置高度
        ])
        
        // 设置 centerView 和 rightView 的约束
        leftView.widthAnchor.constraint(equalTo: leftView.widthAnchor).isActive = true
        leftView.heightAnchor.constraint(equalTo: leftView.heightAnchor).isActive = true
        centerView.widthAnchor.constraint(equalTo: leftView.widthAnchor).isActive = true
        centerView.heightAnchor.constraint(equalTo: leftView.heightAnchor).isActive = true
        rightView.widthAnchor.constraint(equalTo: leftView.widthAnchor).isActive = true
        rightView.heightAnchor.constraint(equalTo: leftView.heightAnchor).isActive = true
        
        let headerGetCashView = UIView()
        headerGetCashView.layer.cornerRadius = 10
        headerGetCashView.backgroundColor = UIColor.gray
        headerGetCashView.translatesAutoresizingMaskIntoConstraints = false

        let headerBgImg = UIImage(systemName: "house")
        
        view.addSubview(headerGetCashView)
        
        NSLayoutConstraint.activate([
            headerGetCashView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            headerGetCashView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerGetCashView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerGetCashView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // 设置高度
        ])
        
        
        
    }
    
}
