//
//  QuickSort.swift
//  FiftyShadesOfSort
//
//  Created by Vjacheslav Volodko on 07.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//


internal func quickSorted<Element>(array initialArray: [Element],
                                   by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
    var array = initialArray
    quickSort(array: &array, range: 0..<array.count, by: areInIncreasingOrder)
    return array
}

fileprivate func quickSort<Element>(array: inout [Element],
                                    range: CountableRange<Int>,
                                    by areInIncreasingOrder: (Element, Element) -> Bool) {
    guard range.count > 1 else {
        return
    }
    let partitionIndex = partition(array: &array, range: range, by: areInIncreasingOrder)
    quickSort(array: &array, range: range.lowerBound..<partitionIndex, by: areInIncreasingOrder)
    quickSort(array: &array, range: partitionIndex..<range.upperBound, by: areInIncreasingOrder)
}


fileprivate func partition<Element>(array: inout [Element],
                                    range: CountableRange<Int>,
                                    by areInIncreasingOrder: (Element, Element) -> Bool) -> Int {
    let pivot = getPivot(array: array, range: range, by: areInIncreasingOrder)
    var i = range.lowerBound
    var j = range.upperBound - 1
    
    while i <= j {
        while areInIncreasingOrder(array[i], pivot) {
            i += 1
        }
        while areInIncreasingOrder(pivot, array[j]) {
            j -= 1
        }
        if i <= j {
            array.swapAt(i, j)
            i += 1
            j -= 1
        }
        
    }
    
    return i
}


fileprivate func getPivot<Element>(array: [Element], range: CountableRange<Int>,
                                   by areInIncreasingOrder: (Element, Element) -> Bool) -> Element {
    let elementIndex = range.lowerBound + Int(arc4random()) % (range.upperBound - range.lowerBound)
    return array[elementIndex]
}
