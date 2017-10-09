//
//  Array+SortAlgorythm.swift
//  FiftyShadesOfSort
//
//  Created by Vjacheslav Volodko on 05.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//


indirect enum ArraySortAlgorythmType {
    case bubble
    case shaker
    case insertion
    case gnome
    
    case merge
    case mergeMixed(fallbackAlgorythm: ArraySortAlgorythmType,
        fallbackSize: Int) // e.g. on arrays with length < 100 fallbacks to insertion sort
    case quick
    case tripleQuick    // like quick sort, but devides array onto 3 parts instead of two, what decreases recursion depth
    case binaryTree
}


extension Array {
    
    typealias Algorythm = (Array, (Element, Element) -> Bool) -> Array
    
    private func algorythm(for type: ArraySortAlgorythmType) -> Algorythm {
        switch type {
        case .bubble:
            return bubbleSorted
        case .shaker:
            return shakerSorted
        case .insertion:
            return insertionSorted
        case .gnome:
            return gnomeSorted
        case .merge:
            return mergeSorted
        case let .mergeMixed(fallbackAlgorythm, size):
            return { (array: [Element], comparator: (Element, Element) -> Bool) -> [Element] in
                return mergeMixedSorted(array: array, fallingBackTo: fallbackAlgorythm, at: size, by: comparator)
            }
        case .quick:
            return quickSorted
        case .tripleQuick:
            return tripleQuickSorted
        case .binaryTree:
            return binaryTreeSorted
        }
    }
    
    func sorted(with algorythmType: ArraySortAlgorythmType,
                by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        let algo = algorythm(for: algorythmType)
        return algo(self, areInIncreasingOrder)
    }
    
    mutating func sort(with algorythm: ArraySortAlgorythmType,
                       by areInIncreasingOrder: (Element, Element) -> Bool) {
        self = self.sorted(with: algorythm, by: areInIncreasingOrder)
    }
    
    
}
