//
//  ShakerSort.swift
//  FiftyShadesOfSort
//
//  Created by Vjacheslav Volodko on 05.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//

internal func shakerSorted<Element>(array initialArray: [Element],
                                    by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
    var array = initialArray
    var leftIndex = 0
    var rightIndex = array.count - 1
    while leftIndex < rightIndex {
        var swaped = false
        for i in leftIndex..<rightIndex {
            if !areInIncreasingOrder(array[i], array[i+1]) {
                array.swapAt(i, i+1)
                rightIndex = i
                swaped = true
            }
        }
        if !swaped {
            return array
        }
        
        swaped = false
        for i in (leftIndex..<rightIndex).reversed() {
            if !areInIncreasingOrder(array[i], array[i+1]) {
                array.swapAt(i, i+1)
                leftIndex = i
                swaped = true
            }
        }
        if !swaped {
            return array
        }
        
    }
    return array
}


