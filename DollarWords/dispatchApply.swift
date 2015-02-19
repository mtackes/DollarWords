//
//  original.swift
//  DollarWords
//
//  Created by Michael Tackes on 2/18/15.
//  Copyright (c) 2015 Michael Tackes. All rights reserved.
//

import Foundation

func dispatchApply(words: [String]) {
    
    dispatch_apply(UInt(words.count), dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
        let word = words[Int($0)]
        if word.centValue() == 100 {
            dispatch_async(dispatch_get_main_queue()) {
                println(word)
            }
        }
    }
    
    CFRunLoopRun()
}
