//
//  HomePageViewController.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/4.
//

import Foundation
import UIKit


class IndexPageViewController : UIPageViewController ,UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    
    var currentPageIndex:Int = 0
    var pageTitles:[String] = ["Page1","Page2","Page3","Page4","Page5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let startViewCtrl = viewContollerAtIndex(index: 0){
            let viewCtrl = [startViewCtrl]
            self.setViewControllers(viewCtrl, direction: .forward, animated: true,completion: nil)
        }
            
    }
    
    func loadPageConfig(){
        if let url = URL(string: "https://api.example.com/data") {
         //   fetchData(from: url)
        }
    }
    
   
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewCtrl = viewController as? IndexContentPageViewCtl else {
            return nil
        }
        var index = viewCtrl.pageIndex
        if index == 0 ||  index == NSNotFound {
            return nil
        }
        index-=1
        return viewContollerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewCtrl = viewController as? IndexContentPageViewCtl else {
            return nil
        }
        var index = viewCtrl.pageIndex
        if index == NSNotFound {
            return nil
        }
        index+=1
        return viewContollerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed,let viewCtrl = pageViewController.viewControllers?.first as? IndexContentPageViewCtl{
            currentPageIndex = viewCtrl.pageIndex
            (parent as? HomeMainViewCtrl)?.updateSegmentedControl(index: currentPageIndex)
        }
    }
    
    func viewContollerAtIndex(index:Int) -> IndexContentPageViewCtl?{
        if(pageTitles.count == 0 || index>=pageTitles.count){
            return nil
        }
        
        return IndexContentPageViewCtl(pageIndex: index, pageTitle: pageTitles[index]);
    }
}
