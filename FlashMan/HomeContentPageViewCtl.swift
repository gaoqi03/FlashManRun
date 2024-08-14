//
//  IndexContentPageViewCtl.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/10.
//

import Foundation
import UIKit
import WebKit
class IndexContentPageViewCtl:UIViewController{
    var pageIndex:Int
    var pageTitle:String
    
    var webView:WKWebView
    
    init(pageIndex: Int,pageTitle:String) {
        self.pageIndex = pageIndex
        self.pageTitle = pageTitle
        webView = WKWebView()
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView)
        
        // 设置 WebView 的布局约束
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        if let destUrl = URL(string: "https://www.baidu.com"){
            let request = URLRequest(url: destUrl)
            webView.load(request)
        }
            
    }
    
    
}
