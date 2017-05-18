//
//  VariadicParameterFunc.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/17.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//可变参数函数. 一个函数只能有一个可变参数
func add(input: Int...) -> Int {
    return input.reduce(0, +)
}

func sayHello (numbers: Int..., string: String) {
    numbers.forEach { //1, 2, 3
        for i in 0..<$0 {  //$0闭包是参数的缩写
            print("\(i+1):\(string)")
        }
    }
}


func testVariadicParameterFunc() {
    print(add(input: 1,2,3,4,5))
    sayHello(numbers: 1,2,3, string: "hello")
    
}


//extension NSString {
//    //CVarArg 是类似于C语言的va_list 是一个参数列表
//    public convenience init(format: NSString, _ args: CVarArg...)
//
//    }
//}
