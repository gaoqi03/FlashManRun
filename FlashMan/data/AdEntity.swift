//
//  AdEntity.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/11.
//

import Foundation
class AdEntity {
    var title:String
    var subTitle :String
    var goldReward:String
    var storeReward:String
    
    var completePercent:String
    
    init(title: String, subTitle: String, goldReward: String, storeReward: String,completPer:String) {
        self.title = title
        self.subTitle = subTitle
        self.goldReward = goldReward
        self.storeReward = storeReward
        self.completePercent = completPer
    }
}
