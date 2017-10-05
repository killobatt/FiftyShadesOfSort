//
//  GnomeSort.swift
//  FiftyShadesOfSort
//
//  Created by Vjacheslav Volodko on 06.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//


internal func gnomeSorted<Element>(array initialArray: [Element],
                                   by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
    var array = initialArray
    var currentElement = 1
    var nextElement = 2
    while currentElement < array.count {
        if areInIncreasingOrder(array[currentElement-1], array[currentElement]) {
            currentElement = nextElement
            nextElement += 1
        } else {
            array.swapAt(currentElement-1, currentElement)
            currentElement -= 1
            if currentElement == 0 {
                currentElement = nextElement
                nextElement += 1
            }
        }
        
    }
    return array
}
