//
//  OptionalChaining.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/4.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//optional chaining 可选链
//*** 可选链随时可能返回nil, 可选链返回的都是可选值


class Toy {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Pet {
    var toy: Toy?
}

class Child {
    var pet: Pet?
}

extension Toy {
    func play() {

    }
}

//注意这里play调用的返回值应该也是一个可选类型
let playClosure  = {(child: Child) ->()? in
    child.pet?.toy?.play()
}

func testOptionalChaining() {
    
    let xiaoming = Child()
    let xiaohong = Child()
    let pet = Pet()
    let toy = Toy(name: "wangcai")
    pet.toy = toy
    xiaoming.pet = pet
    
    //这里可以发现 toyName 是一个Optional("wangcai")
    let toyName = xiaoming.pet?.toy?.name
    
    //可选绑定
    if let toyName1 = xiaoming.pet?.toy?.name {
        print("有名字。。。\(toyName1)")
    }
    
    //可选绑定
    if let _:() = playClosure(xiaohong) {
        print("愉快的玩耍")
    }else {
        print("没玩具玩 :( ")
    }
}
