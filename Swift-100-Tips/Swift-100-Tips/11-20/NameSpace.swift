//
//  NameSpace.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/15.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//这里会报错，因为在MutatingProtocol.swift 定义过这个类
//class Person {
//    
//}
//swift命名空间是基于module, 不同的target就相当于不同的module

//同一个module下，可以通过类型嵌套来指定访问范围
struct MyPerson {
    
    class Person {
      //...
    }
}

