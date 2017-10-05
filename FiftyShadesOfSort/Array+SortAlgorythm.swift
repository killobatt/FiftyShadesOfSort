//
//  Array+SortAlgorythm.swift
//  FiftyShadesOfSort
//
//  Created by Vjacheslav Volodko on 05.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//


enum ArraySortAlgorythmType {
    case bubble
    case shaker
    case insertion
    case gnome
}


extension Array {
    
    typealias Algorythm = (Array, (Element, Element) -> Bool) -> Array
    
    private var algorythms: [ArraySortAlgorythmType: Algorythm] {
        return [
            .bubble: bubbleSorted,
            .shaker: shakerSorted,
            .insertion: insertionSorted,
            .gnome: gnomeSorted,
        ]
    }
    
    func sorted(with algorythm: ArraySortAlgorythmType,
                by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        guard let algo = algorythms[algorythm] else {
            fatalError()
        }
        return algo(self, areInIncreasingOrder)
    }
    
    mutating func sort(with algorythm: ArraySortAlgorythmType,
                       by areInIncreasingOrder: (Element, Element) -> Bool) {
        self = self.sorted(with: algorythm, by: areInIncreasingOrder)
    }
    
    
}
