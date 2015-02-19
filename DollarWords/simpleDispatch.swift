//
//  original.swift
//  DollarWords
//
//  Created by Michael Tackes on 2/18/15.
//  Copyright (c) 2015 Michael Tackes. All rights reserved.
//

import Foundation

func simpleDispatch(words: [String]) {
    
    var dollarWords = [String]()
    
    var remainingWords = words.count
    let countQueue = dispatch_queue_create("com.mtackes.dollarwords.counter", nil)
    
    for word in words {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
            if word.centValue() == 100 {
                dispatch_sync(dispatch_get_main_queue()) {
                    dollarWords.append(word)
                }
            }
            
            dispatch_async(countQueue) {
                if --remainingWords == 0 {
                    printAllWithCount(dollarWords)
                    CFRunLoopStop(CFRunLoopGetMain())
                }
            }
        }
    }
    
    CFRunLoopRun()
}
