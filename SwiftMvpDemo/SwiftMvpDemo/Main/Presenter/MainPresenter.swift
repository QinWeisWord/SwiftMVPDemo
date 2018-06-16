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
    func setPeople(people : [User])
    
    /// 查询结果为空
    func setEmpty()
}

/// 这个功能需要用到的数据，主要目的是让View层与model层解耦
public class User: NSObject {
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
        
        // 获取数据并处理
        Person.getPeople { (people) -> (Void) in
            view.endLoad()
            // people为空时view加载空界面
            guard let people = people else {
                view.setEmpty()
                return
            }
            
            // people不为空时将model的数据处理转换成view需要的数据
            var users = [User]()
            for p in people {
                let u = User(name: p.name)
                users.append(u)
            }
            
            // 当数据数量为0时，view加载空界面
            if people.count == 0 {
                view.setEmpty()
                return
            }
            
            // view根据数据更新界面
            view.setPeople(people: users)
        }
    }
}
