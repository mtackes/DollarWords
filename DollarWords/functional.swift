//
//  functional.swift
//  DollarWords
//
//  Created by Michael Tackes on 2/18/15.
//  Copyright (c) 2015 Michael Tackes. All rights reserved.
//

import Foundation

// Not part of the GCD talk, just a favorite of mine
func functional(words: [String]) {
    
    printAllWithCount(words.reduce([]) { (dollarWords, word) -> [String] in
        word.centValue() == 100 ? dollarWords + [word] : dollarWords
    })
}
