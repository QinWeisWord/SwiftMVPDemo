//
//  Person.swift
//  SwiftMvpDemo
//
//  Created by 秦威 on 2018/6/16.
//  Copyright © 2018年 秦威. All rights reserved.
//

import UIKit

public enum Gender : String{
    case male = "male"
    case female = "female"
}

public class Person: BaseModel {
    var name : String = ""
    var age : Int = 0
    var gender : Gender = .male
    
    // 初始化
    init(name : String, age : Int, gender : Gender) {
        self.name = name
        self.age = age
        self.gender = gender
        super.init()
    }
    
    public override var description: String {
        return "person's name : \(name), person's age : \(age), person's gender : \(gender)"
    }
    
    // 获取数据
    class func getPeople(result : @escaping ([Person]?) -> (Void)) {
        // 假设数据
        let p1 = Person(name: "a", age: 10, gender: .male)
        let p2 = Person(name: "b", age: 11, gender: .male)
        let p3 = Person(name: "c", age: 12, gender: .male)
        let p4 = Person(name: "d", age: 13, gender: .male)
        let p5 = Person(name: "e", age: 14, gender: .male)
        let p6 = Person(name: "f", age: 15, gender: .male)
        let p7 = Person(name: "g", age: 16, gender: .male)
        let p8 = Person(name: "h", age: 17, gender: .male)
        let p9 = Person(name: "i", age: 18, gender: .male)
        let p10 = Person(name: "j", age: 19, gender: .male)
        let people = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]
        
        // 模拟网络延迟
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//            result([Person]())
            result(people)
//            result(nil)
        }
    }
}
