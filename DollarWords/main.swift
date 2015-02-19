//
//  main.swift
//  DollarWords
//
//  Created by Michael Tackes on 2/18/15.
//  Copyright (c) 2015 Michael Tackes. All rights reserved.
//

import Foundation

extension String {
    func centValue() -> Int {
        // Cheating here - won't be totally accurate showing GCD performance
        NSThread.sleepForTimeInterval(Double(self.utf16Count) * 0.000002)
        
        return reduce(self.utf16, 0) { (cents, character) -> Int in
            var characterValue: Int
            switch character {
            case 65...90: // A...Z
                characterValue = character - 64
            case 97...122: // a...z
                characterValue = character - 96
            default:
                characterValue = 0
            }
            
            return cents + characterValue
        }
    }
}

func printAllWithCount<T>(things: Array<T>) {
    for thing in things {
        println(thing)
    }
    println()
    println(things.count)
}

let wordsURL = NSURL(string: "file:/usr/share/dict/web2")!
let wordsString = String(contentsOfURL: wordsURL, encoding: NSUTF8StringEncoding, error: nil)!

let allWords = wordsString.componentsSeparatedByCharactersInSet(.newlineCharacterSet())

original(allWords)

//simpleDispatch(allWords)

//dispatchApply(allWords) // Slightly different behavior

//dispatchGroups(allWords)
