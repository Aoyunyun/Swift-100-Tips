//
//  Currying.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/4/27.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//柯里化:指的是从一个多参数函数变成一连串单参数函数的变换
    
func add(a: Int, b: Int) -> Int {
    return a + b
}

//1.addCurry(Int)返回值是一个闭包，类型：(Int) -> Int
//2.再传入一个Int, 返回一个Int
func addCurry(_ a: Int) -> (Int) -> Int {
    return { (b: Int) -> Int  in
        return a + b
    }
}

//example target-action
protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>:TargetAction {
    var target:T?
    //柯里化，就可以传入一个实例方法, 可以替代原生的selector
    let action:(T) -> () -> ()
    
    func performAction() {
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case touchUpInside
    case touchUpOutside
}

class Control {
    var actions = [ControlEvent: TargetAction]()
    
    //@escaping 逃逸闭包
    func setTarget<T: AnyObject>(target:T, action:@escaping (T) -> () -> (), controlEvent: ControlEvent ) {
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
    }
    
    func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
    func removeActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
}







