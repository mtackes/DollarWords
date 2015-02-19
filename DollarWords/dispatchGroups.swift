//
//  original.swift
//  DollarWords
//
//  Created by Michael Tackes on 2/18/15.
//  Copyright (c) 2015 Michael Tackes. All rights reserved.
//

import Foundation

func dispatchGroups(words: [String]) {
    
    var dollarWords = [String]()
    let wordsGroup = dispatch_group_create()
    
    for word in words {
        dispatch_group_async(wordsGroup, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
            if word.centValue() == 100 {
                dispatch_sync(dispatch_get_main_queue()) {
                    dollarWords.append(word)
                }
            }
        }
    }
    
    dispatch_group_notify(wordsGroup, dispatch_get_main_queue()) {
        printAllWithCount(dollarWords)
        CFRunLoopStop(CFRunLoopGetMain())
    }
    
    CFRunLoopRun()
}
