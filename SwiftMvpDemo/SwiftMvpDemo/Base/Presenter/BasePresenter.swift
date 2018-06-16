//
//  BasePresenter.swift
//  SwiftMvpDemo
//
//  Created by 秦威 on 2018/6/16.
//  Copyright © 2018年 秦威. All rights reserved.
//

import UIKit

public protocol BasePresentDelegate : NSObjectProtocol {
    
}


public class BasePresenter: NSObject {
    /// 需要绑定的View
    weak var attachView : BasePresentDelegate?
    
    /// 绑定View
    ///
    /// - Parameter view: 需要绑定的View
    func attachView(_ view : BasePresentDelegate) {
        self.attachView = view
    }
    
    /// 解绑View（由于attachView为弱引用，不会造成循环引用，所以该方法可以不调用）
    func detachView() {
        self.attachView = nil
    }
}
