//
//  Initial.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/17.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//Swift初始化 需要 保证类型的所有属性都被初始化
//1.设置子类自己需要初始化的参数
//2.调用父类初始化方法
//3.对父类中需要改变的成员进行设置

class Cat1 {
    var name: String
    init() {
        name = "cat"
    }
}

class Tiger1: Cat1 {
    let power: Int
    override init() {
        power = 10
//        super.init() 我们可以不显式调用，到初始化最后，Swift会帮我们自动完成
//        name = "tiger" 如果我们不打算修改name
    }
}

//Swift designated -- 指定初始化方法， 不需要任何修饰
//在方法中需要对所有非Optional实例进行赋值
//子类中也需要显式（或隐式）调用super的指定初始化方法


//Swift convenience -- 便利初始化方法
//convenience 初始化方法都必须调用同一个类中designated 初始化方法来完成初始化
//convenience 初始化方法 不能被子类重写，也不能被子类用super方式调用

class ClassA {
    let numA: Int
    init(num: Int) {
        numA = num  //因为初始化方法只会调用一次，所以对常量赋值没毛病
    }
    
    required convenience init(bigNum: Bool) {
        self.init(num: bigNum ? 10000 : 1)
    }
}

class ClassB: ClassA {
    let numB: Int
    
    override init(num: Int) {
        numB = num + 1
        super.init(num: num)
    }
    
    //加了required 子类可以不直接使用父类的convenience初始化方法，而由自己重写
    convenience required init(bigNum: Bool) {
        self.init(num: bigNum ? 10 : 1)
    }
    
}

//Swift required -- 要求子类必须重写实现
//required 修饰 designated 初始化方法， 那子类就必须重写父类的designated 初始化方法，可以放心调用父类的convenience 初始化方法
//required 修饰 convenience 初始化方法, 子类可以不直接使用父类的convenience初始化方法，而由自己重写


//初始化路径必须保证所有对象完全初始化，可以通过designated 初始化方法来保证
//子类的designated 初始化方法必须调用父类的 designated初始化方法来保证父类也完全初始化


//初始化返回nil
extension Int {
    init?(fromString: String) {
        self = 0
        var digit = fromString.characters.count - 1
        
        for c in fromString.characters {
            var number = 0
            if let n = Int(String(c)){
                number = n
                }else {
                switch c {
                    case "一": number = 1
                    case "二": number = 2
                    case "三": number = 3
                    case "四": number = 4
                    case "五": number = 5
                    case "六": number = 6
                    case "七": number = 7
                    case "八": number = 8
                    case "九": number = 9
                    case "零": number = 0
                    default: return nil
                }
            }
            
            //public func pow(_ X: Double, _ Y: Double) -> Double 求x的y次方
            self = self + number * Int(pow(10, Double(digit)))
            digit = digit - 1
        }
    }
}


func testInitial() {
    print(Tiger1().name)
    
    //子类重写了父类designated 初始化方法， 所以也可以调用父类convenience 初始化方法(因为是通过调用实现的)
    let b = ClassB(bigNum: true)
    print(b.numB)
    
    //public init?(string: String) 可以返回nil 的初始化方法
    if let url = URL(string: "ht tp:www.baidu.com") {
        print("url \(url)") //url is nil
    }
    
    let num = Int(fromString: "七八九")
    print(num) //Optional(789)
}

