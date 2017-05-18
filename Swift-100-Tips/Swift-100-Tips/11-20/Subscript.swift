//
//  Subscript.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/5/15.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//Array
//public subscript(index: Int) -> Element
//public subscript(bounds: Range<Int>) -> ArraySlice<Element>
//数组的下标必须有效，不能越界
let array = ["1","2","3","4"]
let one = array[0]
//subArr 采用和array一样的索引
let subArr = array[2..<array.count]



//Dictionary
//这两个方法下标必须有效
//public subscript(position: [Key : Value].Index) -> (key: Key, value: Value) { get }
//public subscript(bounds: Range<Dictionary<Key, Value>.Index>) -> Slice<Dictionary<Key, Value>> { get }

//这个方法下标key可以有也可以没有，返回一个可选型
//public subscript(key: Key) -> Value?

let dictionary = ["1":"one", "2":"two", "3":"three"]
let index = dictionary.index(where: {$0.value == "two"})

let subDic = dictionary[index!..<dictionary.endIndex]

func testSubscript() {
    print(one)
    print(subArr) //["3", "4"]
    print(subArr[3]) //4
    
    print(dictionary[index!])
    
    let index1 = subDic.index(where: {$0.value == "three"})
    print(subDic[index1!])
    
//    print(dictionary["4"]) //nil
//    print(dictionary["1"]) //Optional("one")
    
    var newArray = [1, 20, 4, 5, 7]
    let someValue = newArray[[1,2,3]]
    print(someValue)
    
    newArray[[1,2,3]] = [8, 9, 10]
    print(newArray)
}

extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {
        set {
            //i is index, x is value
            for (i, x) in input.enumerated() {
                assert(x < self.count, "index out of range")
                self[x] = newValue[i]
            }
        }
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "index out of range")
                result.append(self[i])
            }
            return result
        }
    }
    
//    subscript(first: Int, second: Int, other: Int...) -> ArraySlice<Element> {
//        
//    }
    
}





