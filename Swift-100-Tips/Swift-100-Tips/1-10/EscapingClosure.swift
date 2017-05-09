//
//  EscapingClosure.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/3.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//非逃逸闭包，在函数返回之前就会执行block
func doWork(block: () ->()) {
    block()
}

//逃逸闭包, 闭包的作用域超出函数本身
//逃逸闭包中引用self及其成员时，需要明确写出self
//***如果协议方法定义了逃逸闭包，那么实现的时候也需要带上@escaping，否则认为方法签名不一致报错
func asyncDoWork(block: @escaping ()->()) {
    DispatchQueue.main.async {
        block()
    }
}

//MARK: - testEscaping
class S {
    var foo = "123"
    func testNoEscaping() {
        
        doWork {
            print("no escaping \(foo)")
        }
        foo = "456"
    }
    
    func testEscaping() {
        
        asyncDoWork {
            //这里需要明确写出self，确保闭包内的成员依然有效
            print("escaping \(self.foo)")
        }
        foo = "456"
    }
    
    func testWeakSelf() {
        asyncDoWork {
            //如果是弱引用self，在闭包执行的时候已经释放
            [weak self] _ in
               print("escaping \(self?.foo)")
            
        }
    }
    
    
}





