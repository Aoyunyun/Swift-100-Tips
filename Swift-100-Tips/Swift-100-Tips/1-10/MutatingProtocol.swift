//
//  MutatingProtocol.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/4/28.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

protocol ChangeDescription {
    var des: String {set get}
    //这里可以试试不加mutating会怎样？
    mutating func description()
}

class Person: ChangeDescription {
    var name = "xiaoming"
    var des: String {
        set {
            name = newValue
        }
        get {
            return name
        }
    }
    
    //类 本身就可以修改属性值，所以不需要mutating 修饰协议方法
    func description() {
        des = "xiaomingWang"
    }
}

struct Card: ChangeDescription {
    var shape: String
    var color: String
    
    var des: String {
        set {
            color = newValue
        }
        get {
            return color
        }
    }
    //如果协议方法没有标注 mutating 那在struct 和 enum 实现协议方法，内部不可以修改属性值
    mutating func description() {
        shape = "♦️"
        des = "red"
    }
}

enum Direction: ChangeDescription {
    case east
    case west
    case north
    case south
    
    //enum 没有存储属性, 只有计算属性
    var des: String {
        set {
            
        }
        get {
            return "enum"
        }
    }
    
    mutating func description() {
        
    }
}
