//
//  InsertionSort.swift
//  FiftyShadesOfSort
//
//  Created by Vjacheslav Volodko on 06.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//


internal func insertionSorted<Element>(array initialArray: [Element],
                                       by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
    var array = initialArray

    guard !array.isEmpty else { return array }

    for i in 1...array.count {
        var j = i - 1
        while j > 0 && !areInIncreasingOrder(array[j-1], array[j]) {
            array.swapAt(j-1, j)
            j -= 1
        }
    }
    return array
}


