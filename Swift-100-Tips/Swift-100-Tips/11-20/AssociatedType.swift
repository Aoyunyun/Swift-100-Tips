//
//  AssociatedType.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/15.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//协议中定义属性（占位符）
//associatedtype 协议不关心这个属性的具体类型，由实现者去自行定义
class Food {
    
}
class Meat: Food {
    
}
class Grass: Food {
    
}

protocol Animal {
    associatedtype F: Food //如果这里指明满足某个协议，实现时就不需要再指明F的类型
    func eat(food: F)
}

struct Tiger :Animal {
//    typealias F = Meat
    func eat(food: Meat) {
        
    }
}

struct Sheep : Animal{
    func eat(food: Grass) {
        
    }
}

//使用了associatedtype 的协议类型不能作为作为独立类型来使用了，因为包含了不确定的类型
//func isAnimalDengerous(animai: Animal) -> Bool {
//    
//}

//使用了associatedtype 就只能作为泛型约束
func isAnimalDengerous<T: Animal>(animal: T) -> Bool {
    if animal is Tiger {
        return true
    }else {
        return false
    }
}
