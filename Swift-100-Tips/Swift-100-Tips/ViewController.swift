//
//  ViewController.swift
//  Swift-100-Tips
//
//  Created by ayy on 2017/4/27.
//  Copyright © 2017年 Aoyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        testCurry()
        
        testSequence()
        
        testTuple()
        
        S().testNoEscaping()
        S().testEscaping()
        S().testWeakSelf()
        
        testOptionalChaining()
        
        testVector2DAdd()
        
        testIncrementor()
    }
    
    //MARK: - Currying
    let control = Control()
    
    @IBAction func ExecuteCurry(_ sender: Any) {
       control.performActionForControlEvent(controlEvent: ControlEvent.touchUpInside)
    }
    
    func testCurry() {
        //add
        let a = addCurry(8)
        let result = a(10)
        print(result)
                
        //target-action
        //ViewController.controlOnTap类型 : ViewController -> () ->()
        control.setTarget(target: self, action:ViewController.controlOnTap , controlEvent: ControlEvent.touchUpInside)
    }
    
    //实例方法都被柯里化成一个需要传入一个实例，返回一个参数为这个方法的参数类型，返回值为这个方法返回值类型的闭包
    func controlOnTap()  {
        print("control was tapped")
    }
    
}

