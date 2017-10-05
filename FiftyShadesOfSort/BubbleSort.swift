//
//  BubbleSort.swift
//  FiftyShadesOfSort
//
//  Created by Vjacheslav Volodko on 05.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//


internal func bubbleSorted<Element>(array initialArray: [Element],
                                    by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
    var array = initialArray
    for i in 0..<array.count-1 {
        for j in 0..<array.count-i-1 {
            if !areInIncreasingOrder(array[j], array[j+1]) {
                array.swapAt(j, j+1)
            }
        }
    }
    return array
}

