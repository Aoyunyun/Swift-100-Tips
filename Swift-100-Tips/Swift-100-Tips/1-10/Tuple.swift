//
//  Tuple.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/2.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation
import UIKit

//元组

//OC切割矩形的方法
//CG_EXTERN void CGRectDivide(CGRect rect, CGRect *  slice,
//CGRect *  remainder, CGFloat amount, CGRectEdge edge)
//CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

//swift切割矩形的方法
//public func divided(atDistance: CGFloat, from fromEdge: CGRectEdge) -> (slice: CGRect, remainder: CGRect)

//元组作为返回值

class Calculater {
    func minAndMax(arr: [Int]) -> (min: Int, max: Int) {

        if arr.count > 0 {
            var currentMin = arr[0]
            var currentMax = arr[0]
            for i in 1..<arr.count {
                if arr[i] > currentMax {
                    currentMax = arr[i]
                }else if arr[i] < currentMin {
                    currentMin = arr[i]
                }
            }
            return(currentMin, currentMax)
        }
        return (0, 0)
    }
}


//MARK: - Tiple
func testTuple() {
    let arr = [1, 20, 8, 9, 3]
    let result = Calculater().minAndMax(arr: arr)
    print("min: \(result.min), max \(result.max)")
}
