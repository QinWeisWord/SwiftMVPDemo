//
//  MainPresenter.swift
//  SwiftMvpDemo
//
//  Created by 秦威 on 2018/6/16.
//  Copyright © 2018年 秦威. All rights reserved.
//

import UIKit

/// 代理方法
public protocol MainPresenterDelegate : BasePresentDelegate {
    
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

class User: NSObject {
    var name = ""
    init(name : String) {
        self.name = name
    }
}

public class MainPresenter: BasePresenter {
    
    override func attachView(_ view: BasePresentDelegate) {
        self.attachView = view as? MainPresenterDelegate
    }
    
    /// 开始查询
    func getPeople() {
        guard let attachView = attachView else { return  }
        
        let view = attachView as! MainPresenterDelegate
        
        view.startLoad()
        Person.getPeople { (people) -> (Void) in
            view.endLoad()
            guard let people = people else {
                view.setEmpty()
                return
            }
            print(people)
            
            if people.count == 0 {
                view.setEmpty()
                return
            }
            
            view.setPeople(people: people)
        }
    }
}
