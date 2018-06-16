//
//  MainPresenter.swift
//  SwiftMvpDemo
//
//  Created by 秦威 on 2018/6/16.
//  Copyright © 2018年 秦威. All rights reserved.
//

import UIKit

/// 代理方法
public protocol MainPresenterDelegate : class {
    /// 开始查询
    func startLoad()
    
    /// 查询结束
    func endLoad()
    
    
    /// 查询结果不为空
    ///
    /// - Parameter people: 结果具体数据
    func setPeople(people : [Person])
    
    /// 查询结果为空
    func setEmpty()
}


public class MainPresenter: NSObject {
    weak var delegate : MainPresenterDelegate?
    
    /// 开始查询
    func getPeople() {
        if let delegate = delegate {
            delegate.startLoad()
            Person.getPeople { (people) -> (Void) in
                delegate.endLoad()
                guard let people = people else {
                    delegate.setEmpty()
                    return
                }
                print(people)
                
                if people.count == 0 {
                    delegate.setEmpty()
                    return
                }
                
                delegate.setPeople(people: people)
            }
        }
    }
}
