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
    let divider = (range.lowerBound + range.upperBound) / 2
    let leftRange = range.lowerBound..<divider
    let rightRange = divider..<range.upperBound
    quickSort(array: &array, range: leftRange, by: areInIncreasingOrder)
    quickSort(array: &array, range: rightRange, by: areInIncreasingOrder)
    array = partition(array: array, begin: range.lowerBound, middle: divider, end: range.upperBound, by: areInIncreasingOrder)
}


fileprivate func partition<Element>(array: [Element], begin: Int, middle: Int, end: Int,
                                    by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
    var mergedArray = array
    var i = begin
    var j = middle
    
    for k in begin..<end {
        if j >= end || (i < middle && areInIncreasingOrder(array[i], array[j])) {
            mergedArray[k] = array[i]
            i += 1
        } else {
            mergedArray[k] = array[j]
            j += 1
        }
    }
    
    return mergedArray
}
