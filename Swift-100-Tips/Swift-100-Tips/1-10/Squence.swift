//
//  Squence.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/4/28.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import Foundation

//实现sequence 协议，就可以实现用 for...in 来遍历我们自定义的类

class Book {
    var name: String
    var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}

//public protocol IteratorProtocol {
//   associatedtype Element
//   public mutating func next() -> Self.Element?
//}
class BookListIterator :IteratorProtocol {
   typealias Element = Book
    var currentIndex = 0
    var bookList: [Book]?
    
    init(bookList: [Book]) {
        self.bookList = bookList
    }
    
    func next() -> Book? {
        guard let list = bookList else { return nil }
        if currentIndex < list.count {
            let book = list[currentIndex]
            currentIndex += 1
            return book
        }else {
            return nil
        }
    }
}

//实现Sequence 协议，不仅可以实现for...in 功能，还可以实现map， filter， reduce
class BookList: Sequence {
    typealias Iterator = BookListIterator
    var bookList: [Book]?
    
    init() {
        self.bookList = [Book]()
    }
    
    func addBook(book: Book){
        self.bookList?.append(book)
    }
    
    func makeIterator() -> BookListIterator {
        return BookListIterator(bookList: self.bookList!)
    }
    
}

//MARK: - 写一个喵神的反序数组
class ReverseIterator<T>: IteratorProtocol {
    typealias Element = T
    
    let array: [T]
    var index = 0
    
    init(array: [T]) {
        self.array = array
        index = array.count - 1
    }
    
    func next() -> Element? {
        if index < 0 {
            return nil
        }else {
            let element = array[index]
            index -= 1
            return element
        }
        
    }
}

struct ReverseSquence<T>: Sequence {
    typealias Iterator = ReverseIterator<T>
    
    var arr: [T]
    init(array: [T]) {
        self.arr = array
    }
    
    func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.arr)
    }
}

//MARK: - Sequence
func testSequence() {
    let book = BookList()
    book.addBook(book: Book(name: "iOS", price: 10))
    book.addBook(book: Book(name: "Swift", price: 20))
    book.addBook(book: Book(name: "OC", price: 30))
    
    for b in book{
        print("book name \(b.name), price \(b.price)")
    }
    
    let arr = ReverseSquence(array:["one", "two", "three"])
    //i是数组的元素
    let newArr = arr.map { $0.uppercased() }
    
    for i in newArr {
        print("\(i)")
    }
}




