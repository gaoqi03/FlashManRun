//
//  AdListViewContoller.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/10.
//

import Foundation
import UIKit

class MakeMoneyAdListViewContoller : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    let dataModel = AddTaskModel()
    var selectedAdEntity: AdEntity?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AdTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.layer.cornerRadius = 10
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.systemBlue.cgColor

        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor ),
            tableView.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant: -10 ),
            tableView.leadingAnchor.constraint(equalTo:view.leadingAnchor ,constant: 10),
            tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor ,constant: 10)
        ])
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AdTableViewCell
        
        let adEntity = dataModel.dataList[indexPath.item]
        cell.doTask.addTarget(self, action: #selector(doTaskTapped(_:)), for: UIControl.Event.touchUpInside)

        selectedAdEntity = adEntity
        cell.configure(with: adEntity)
        return cell
    }
    
    @objc func doTaskTapped(_ sender: UIButton) {
        // 处理按钮点击逻辑
        // 使用 sender 来获取相关信息，或从其他地方获取 adEntity
        if let adEntity = selectedAdEntity {
                // 处理按钮点击逻辑
            var taskDetailViewCtrler = TaskDetailController()
            taskDetailViewCtrler.adEntity = adEntity
            self.view.showToast(message:adEntity.title)
            navigationController?.pushViewController(taskDetailViewCtrler, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
   
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
//    }
}

class AdTableViewCell :UITableViewCell {
    
    var adTitle:UILabel = UILabel()
    var subTitle:UILabel = UILabel()
    
    let goldImg = UIImageView(image: UIImage(systemName: "star.fill"))
    var goldReward:UILabel  = UILabel()
    var scoreReward:UILabel = UILabel()
    
    var finishPer:UILabel = UILabel()
    var doTask:UIButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 配置控件
        adTitle.contentMode = .scaleAspectFill
        adTitle.clipsToBounds = true
        adTitle.textColor = .black
        adTitle.font = UIFont.boldSystemFont(ofSize: 20)
        
        subTitle.contentMode = .scaleAspectFill
        subTitle.clipsToBounds = true
        subTitle.textColor = .gray
        subTitle.font = UIFont.boldSystemFont(ofSize: 14)
        
        goldReward.font = UIFont.systemFont(ofSize: 14)
        goldReward.textColor = .red
        goldReward.font = UIFont.boldSystemFont(ofSize: 26)
        goldImg.tintColor = .systemBlue
        goldImg.contentMode = .scaleAspectFit
        var goldStack = UIStackView(arrangedSubviews: [goldImg, goldReward])
        goldStack.axis = .horizontal
        goldStack.spacing = 5 // 文字和图标之间的间距
        
        scoreReward.font = UIFont.systemFont(ofSize: 40)
        scoreReward.textColor = .blue
        scoreReward.backgroundColor = .yellow
        scoreReward.font = UIFont.boldSystemFont(ofSize: 26)
        
        
        finishPer.font = UIFont.systemFont(ofSize: 14)
        
        doTask.layer.cornerRadius = 15
        doTask.backgroundColor = UIColor.systemBlue
        doTask.layer.masksToBounds = true
        doTask.setTitle("去完成", for: UIControl.State.application)
        doTask.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

        
        // 添加控件到内容视图
        contentView.addSubview(adTitle)
        contentView.addSubview(subTitle)
        contentView.addSubview(goldStack)
        contentView.addSubview(scoreReward)
        contentView.addSubview(finishPer)
        contentView.addSubview(doTask)
        
        // 设置控件的布局
        adTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        goldStack.translatesAutoresizingMaskIntoConstraints = false
        scoreReward.translatesAutoresizingMaskIntoConstraints = false
        finishPer.translatesAutoresizingMaskIntoConstraints = false
        doTask.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // 布局 customImageView
            adTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            adTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            subTitle.topAnchor.constraint(equalTo: adTitle.bottomAnchor,constant: 10),
            subTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 10),
            subTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            goldStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            goldStack.topAnchor.constraint(equalTo: subTitle.bottomAnchor,constant: 10),
            goldStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),


            scoreReward.topAnchor.constraint(equalTo: subTitle.bottomAnchor,constant: 10),
            scoreReward.leadingAnchor.constraint(equalTo: goldStack.trailingAnchor,constant: 10),
            scoreReward.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 10),
            scoreReward.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            
            finishPer.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            finishPer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
   
            doTask.topAnchor.constraint(equalTo: finishPer.bottomAnchor, constant: 10),
            doTask.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
           ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(Coder:) has been implemented !")
    }
    
    func configure(with model:AdEntity){
        adTitle.text = model.title
        subTitle.text = model.subTitle
        
        goldReward.text = model.goldReward
        scoreReward.text = model.storeReward
        
        finishPer.text = model.completePercent
        doTask.setTitle("去完成", for: .normal)
    }
    
    
}


extension UIView {
    func showToast(message: String, duration: Double = 2.0) {
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textColor = .white
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 14.0)
        toastLabel.numberOfLines = 0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        // 设置 Toast 的宽度和位置
        let maxSize = CGSize(width: self.frame.size.width - 40, height: self.frame.size.height)
        let expectedSize = toastLabel.sizeThatFits(maxSize)
        toastLabel.frame = CGRect(x: (self.frame.size.width - expectedSize.width) / 2,
                                  y: self.frame.size.height - 100,
                                  width: expectedSize.width + 20,
                                  height: expectedSize.height + 20)

        self.addSubview(toastLabel)

        // 动画显示和隐藏
        toastLabel.alpha = 0.0
        UIView.animate(withDuration: 0.5, animations: {
            toastLabel.alpha = 1.0
        }) { (completed) in
            UIView.animate(withDuration: 0.5, delay: duration, options: [], animations: {
                toastLabel.alpha = 0.0
            }) { (completed) in
                toastLabel.removeFromSuperview()
            }
        }
    }
}

