//
//  AddTaskModel.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/11.
//

import Foundation

class AddTaskModel {
    
    var dataList = [AdEntity]()
    
    init(dataList: [AdEntity] = [AdEntity]()) {
        
        setData()
    }
    
    func setData(){
        dataList.append(AdEntity(title: "观看广告", subTitle: "每观看一次视频广告，均可获得奖励", goldReward: "10800", storeReward: "200", completPer: "0/10"))
        dataList.append(AdEntity(title: "领取20次语音红包奖励", subTitle: "每完成一次语音任务，都可获得奖励", goldReward: "388", storeReward: "60", completPer: "0/10"))
        dataList.append(AdEntity(title: "当前看资讯领20次金币", subTitle: "看资讯，赚金币", goldReward: "208", storeReward: "30", completPer: "0/10"))
        dataList.append(AdEntity(title: "当前刷视频领20次金币", subTitle: "刷视频，赚金币", goldReward: "120", storeReward: "15", completPer: "0/10"))
        dataList.append(AdEntity(title: "做阅读任务领提现券", subTitle: "完成一个阅读任务，都能领取奖励", goldReward: "2100", storeReward: "2000", completPer: "0/10"))
        dataList.append(AdEntity(title: "游戏试完高额赚", subTitle: "游戏试玩可获得奖励", goldReward: "3100", storeReward: "111", completPer: "0/10"))
    }
    
    func add2DataList(data:AdEntity){
        dataList.append(data)
    }
    
    func add2DataListAll(datas:[AdEntity]){
        for data in datas {
            dataList.append(data)
        }
    }
}
