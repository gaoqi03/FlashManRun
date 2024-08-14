//
//  ThreadFactory.swift
//  FlashMan
//
//  Created by 高琪 on 2024/8/11.
//

import Foundation
class ThreadFactory {
    
    static let threadPool = DispatchQueue(label: "",attributes: .concurrent)
    
    static let semaphore = DispatchSemaphore(value: 4)
    
    
}
