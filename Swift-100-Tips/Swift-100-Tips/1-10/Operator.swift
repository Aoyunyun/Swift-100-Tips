//
//  Operator.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/4.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//swift支持重载操作符

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

//变换参数进行重载
func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

//prefix infix postfix 表示操作符的位置
prefix func -(v: Vector2D) -> Vector2D {
    return Vector2D(x: -v.x, y: -v.y)
}


//Operator implementation without matching operator declaration 报错说这个操作符没有声明
//precedencegroup 定义一个操作的优先级别
//associativity 声明结合律， 如加减法就是 left(从左往右计算)
//higherThan: 优先级， 高于MultiplicationPrecedence——乘除法
//infix 指定操作符的位置
precedencegroup DotProductPrecedence {
    associativity: none
    higherThan: MultiplicationPrecedence
}

infix operator +*: DotProductPrecedence

func +*(left: Vector2D, right: Vector2D) -> Double {
    return  left.x * right.x +  left.y * right.y
}


func testVector2DAdd() {
    let v1 = Vector2D(x: 1.0, y: 1.0)
    let v2 = Vector2D(x: 2.0, y: 3.0)
    let v3 = v1 + v2
    let result = v1 +* v2
    print(v3)
    print(-v3)
    print(result)
}

// note: swift操作符不能定义在局部域中，因为至少希望在全局范围使用自定义操作符，否则就没什么意义了
