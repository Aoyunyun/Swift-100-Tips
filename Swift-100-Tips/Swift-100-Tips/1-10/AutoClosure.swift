//
//  AutoClosure.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/3.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//public func ??<T>(optional: T?, defaultValue: @autoclosure () throws -> T) rethrows -> T
//public func ??<T>(optional: T?, defaultValue: @autoclosure () throws -> T?) rethrows -> T?

//public static func &&(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool
//public static func ||(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool

//@autoclosure
//并不支持带有输入参数的写法，也就是说只有形如 () -> T 的参数才能使用这个特性进行简化
//把参数转换成闭包，可以很大程度的减小开销，因为方法执行实在判断条件之后

var level: Int?
let startLevel = 0

//let currentlevel = level ?? startLevel

func ??<T>(optional: T?, defaultValue: @autoclosure () throws -> T) rethrows -> T {
    switch optional {
    case .some(let value):
        return value
    case .none:
        return try defaultValue()

    }
}


func &&(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool {
    if lhs {
        return try rhs()
    }else {
        return false
    }
}


func ||(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool {
    if lhs {
        return true
    }else {
        return try rhs()
    }
}
