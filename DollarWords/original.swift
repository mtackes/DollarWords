//
//  original.swift
//  DollarWords
//
//  Created by Michael Tackes on 2/18/15.
//  Copyright (c) 2015 Michael Tackes. All rights reserved.
//

import Foundation

func original(words: [String]) {
    
    var dollarWords = [String]()
    
    for word in words {
    
        if word.centValue() == 100 {
            dollarWords.append(word)
        }
    }
    
    printAllWithCount(dollarWords)
}
