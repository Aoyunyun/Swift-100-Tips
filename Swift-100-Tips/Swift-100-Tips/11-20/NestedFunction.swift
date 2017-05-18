//
//  NestedFunction.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/15.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

func chooseStep(backword: Bool) ->(Int) -> Int {
    func backwordFunc(_ input: Int) -> Int {
        return input + 1
    }
    
    func forwardFunc(_ input: Int) -> Int {
        return input - 1
    }
    
    return backword ? backwordFunc : forwardFunc
}

func testChooseStep() {
    let a = 10
    let b = chooseStep(backword: true)
    print( "NestedFunction \(b(a))")
}
