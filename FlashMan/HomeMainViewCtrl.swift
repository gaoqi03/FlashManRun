//
//  HomeMainViewCtrl.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/4.
//

import Foundation
import UIKit

class HomeMainViewCtrl :ViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var collectionViews:UICollectionView!
    var pageViewController:IndexPageViewController!
    var pageTitles:[String] = ["推荐","健康","本地","体育","热讯","搞笑","影视","军事","生活",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViews()
        setupPageViewController()
    }
    
    func setupCollectionViews(){
        
        var collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 0
        collectionViews = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionViews.backgroundColor = .white
        collectionViews.showsHorizontalScrollIndicator = true
        collectionViews.delegate = self
        collectionViews.dataSource = self
        
        collectionViews.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionViews.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionViews)
        collectionViews.tintColor = .systemBlue
        collectionViews.allowsSelection = true
        
        NSLayoutConstraint.activate([
            collectionViews.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionViews.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViews.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViews.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func setupPageViewController(){
        pageViewController = IndexPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: collectionViews.bottomAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        pageViewController.didMove(toParent: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  pageTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        cell.configure(with: pageTitles[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/CGFloat(pageTitles.count), height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = pageViewController.viewContollerAtIndex(index: indexPath.item) {
            let direction: UIPageViewController.NavigationDirection = indexPath.item > pageViewController.currentPageIndex ? .forward : .reverse
            pageViewController.setViewControllers([viewController], direction: direction, animated: true, completion: nil)
            pageViewController.currentPageIndex = indexPath.item
        }
    }
    
    func updateSegmentedControl(index:Int){
        print("The value is \(index)")
        let indexPath = IndexPath(item: index, section: 0)
        collectionViews.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
}


class CustomCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue // 指示器颜色
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true // 初始状态隐藏
        view.layer.cornerRadius = 5
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(indicatorView)
        
        // 设置 label 的约束
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            indicatorView.heightAnchor.constraint(equalToConstant: 4),
            indicatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            indicatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            indicatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        // 设置选中背景视图
//        let selectedView = UIView()
//        selectedView.backgroundColor = .systemBlue // 选中时的背景颜色
//        selectedBackgroundView = selectedView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    override var isSelected: Bool {
        didSet {
            indicatorView.isHidden = !isSelected
        }
    }
}

