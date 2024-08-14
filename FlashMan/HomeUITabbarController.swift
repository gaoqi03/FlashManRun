//
//  HomeUITabbarController.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/3.
//

import Foundation
import UIKit

class HomeUITabbarController : UITabBarController ,UICollectionViewDelegate{
    var collectionViews :UICollectionView!
    var pageViewController: IndexPageViewController!
    var pageTitles:[String] = ["Page1","Page2","Page3"]
    
    override func viewDidLoad() {
    super.viewDidLoad()
        let indexViewController = HomeMainViewCtrl()
        indexViewController.view.backgroundColor = .white
        indexViewController.tabBarItem = UITabBarItem(title: "首页", image: UIImage(systemName: "house"), tag:0)
        
        let taskViewController = MakeMoneyViewController()
        taskViewController.view.backgroundColor = .white
        taskViewController.tabBarItem = UITabBarItem(title: "任务", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        self.viewControllers = [indexViewController,taskViewController]
    }

    
//    func updateSegementedControl(index:Int){
//        let indexPath = IndexPath(item: index, section: 0)
//        
//        
//    }
    
}
