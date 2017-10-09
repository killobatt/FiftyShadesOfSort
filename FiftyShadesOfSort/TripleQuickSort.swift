//
//  TripleQuickSort.swift
//  FiftyShadesOfSort
//
//  Created by Vjacheslav Volodko on 10.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//


internal func tripleQuickSorted<Element>(array initialArray: [Element],
                                         by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
    var array = initialArray
    tripleQuickSort(array: &array, range: 0..<array.count, by: areInIncreasingOrder)
    return array
}

fileprivate func tripleQuickSort<Element>(array: inout [Element],
                                          range: CountableRange<Int>,
                                          by areInIncreasingOrder: (Element, Element) -> Bool) {
    guard range.count > 1 else {
        return
    }
    let partition = calculatePartition(array: &array, range: range, by: areInIncreasingOrder)
    tripleQuickSort(array: &array, range: range.lowerBound..<partition.leftIndex, by: areInIncreasingOrder)
    tripleQuickSort(array: &array, range: partition.leftIndex..<partition.rightIndex, by: areInIncreasingOrder)
    tripleQuickSort(array: &array, range: partition.rightIndex..<range.upperBound, by: areInIncreasingOrder)
}


fileprivate func calculatePartition<Element>(array: inout [Element],
                                    range: CountableRange<Int>,
                                    by areInIncreasingOrder: (Element, Element) -> Bool) -> (leftIndex: Int, rightIndex: Int) {
    let pivots = getPivot(array: array, range: range, by: areInIncreasingOrder)
    var i = range.lowerBound
    var j = range.upperBound - 1

    while i <= j {
        while areInIncreasingOrder(array[i], pivots.leftPivot) {
            i += 1
        }
        while areInIncreasingOrder(pivots.leftPivot, array[j]) {
            j -= 1
        }
        if i <= j {
            array.swapAt(i, j)
            i += 1
            j -= 1
        }
    }

    let leftIndex = i

    j = range.upperBound - 1

    while i <= j {
        while areInIncreasingOrder(array[i], pivots.rightPivot) {
            i += 1
        }
        while areInIncreasingOrder(pivots.rightPivot, array[j]) {
            j -= 1
        }
        if i <= j {
            array.swapAt(i, j)
            i += 1
            j -= 1
        }
    }

    let rightIndex = i

    return (leftIndex, rightIndex)
}


fileprivate func getPivot<Element>(array: [Element], range: CountableRange<Int>,
                                   by areInIncreasingOrder: (Element, Element) -> Bool) -> (leftPivot: Element, rightPivot: Element) {
    let elementIndex1 = range.lowerBound + Int(arc4random()) % (range.upperBound - range.lowerBound)
    let elementIndex2 = range.lowerBound + Int(arc4random()) % (range.upperBound - range.lowerBound)

    return (leftPivot:  array[min(elementIndex1, elementIndex2)],
            rightPivot: array[max(elementIndex1, elementIndex2)])
}
