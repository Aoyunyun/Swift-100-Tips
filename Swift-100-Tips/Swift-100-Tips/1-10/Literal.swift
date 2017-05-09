//
//  Literal.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/5.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//字面量
let aNumber = 1
let aString = "Hello"
let aBool = true

let aArray = [1,2,3]
let aDicitonary = ["key1":"value1", "key2":"value2"]

//ExpressibleByNilLiteral
//ExpressibleByArrayLiteral
//ExpressibleByFloatLiteral
//ExpressibleByStringLiteral
//ExpressibleByBooleanLiteral
//ExpressibleByDictionaryLiteral
//...

//实现字面量，就必须实现相应的字面量协议
//public protocol ExpressibleByArrayLiteral {
//    
//    /// The type of the elements of an array literal.
//    associatedtype Element
//    
//    /// Creates an instance initialized with the given elements.
//    public init(arrayLiteral elements: Self.Element...)
//}

enum MyBool: Int {
    case myTrue
    case myFalse
}

extension MyBool: ExpressibleByBooleanLiteral {
   typealias BooleanLiteralType  = Bool
    init(booleanLiteral value: Bool) {
        self = value ? MyBool.myTrue : MyBool.myFalse
    }
}

let testMyBool: MyBool = true


//给自定义的类实现字面量
//不能在extension 中定义required初始化方法，所以我们不能为现有的 非final 的 class 添加字面量表达式
class Person1: ExpressibleByStringLiteral {
    let name: String
    init(name value: String) {
        self.name = value
    }
    
    required convenience init(stringLiteral value: String) {
        self.init(name: value)
    }
    
    required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(name: value)
    }
    
    required convenience init(unicodeScalarLiteral value: String) {
        self.init(name: value)
    }
    
}

let p: Person1 = "xiaoming"




