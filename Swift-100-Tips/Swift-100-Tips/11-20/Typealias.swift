//
//  Typealias.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/15.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation
import UIKit

//类型别名, 可以让代码更易于理解
typealias Worker = Person

typealias Location = CGPoint
typealias Distance = Double

func distance(from location:Location, to anotherLocation: Location) -> Distance {
    let dx = Distance(location.x - anotherLocation.x)
    let dy = Distance(location.y - anotherLocation.y)
    return sqrt(dx * dx + dy * dy)
}

//对于泛型需要注意
class Flower<T> {
    
}
//typealias 必须对单一类型重命名，不能对整个泛型重命名， 下面两种写法都是编译不过的
//typealias Rose = Flower
//typealias Rose = Flower<T>

//别命中引入泛型也可以
typealias Rose<T> = Flower<T>

//组合多个协议，并给一个易于理解的别名
protocol Cat {}
protocol Dog {}

typealias pet = Cat & Dog
