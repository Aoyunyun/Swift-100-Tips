//
//  Inout.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/5.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//实现一个 +1器
func incrementor(variable: Int) -> Int {
    return variable + 1
}

//func incrementor1(variable: Int) -> Int {
//    //这是错误代码，报错说variable是一个let
//    variable += 1
//    return variable
//}

//这个可以达到效果，但是variable 值是不变的
func incrementor2(variable: Int) -> Int {
    var num = variable
    num += 1
    return num
}

//inout inout修饰的参数在函数内部可以进行更改
//注意，调用时 & 并没有对参数地址进行修改让它指向新的值，而是类似上面incrementor2 先创建一个新的值，在函数返回时把这个值赋给参数变量  因为这是一个值类型
func incrementor3(variable: inout Int) {
    variable += 1
}

//MARK: - testIncrementor
func testIncrementor() {
    
    var a = 1
    var b = 5
    print("\(incrementor(variable: a)), \(a)") //2 1
    
    print("\(incrementor2(variable: a)), \(a)") //2 1
    
    //注意这里调用方式不同
    incrementor3(variable: &a)
    print(a) //2
    
    
    exchangeValue(a: &a, b: &b)
    print(a)
    print(b)
}

func exchangeValue(a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}

