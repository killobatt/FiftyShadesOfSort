//
//  TestData.swift
//  FiftyShadesOfSortTests
//
//  Created by Vjacheslav Volodko on 05.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//

import Foundation


struct TestData {
    let test1Integer = [42]
    let test2Integers = [5, 2]
    let test10Integers = [7, 9, 3, 1, 2, 5, 4, 8, 10, 6]
    
    func testIntegers(count: Int) -> [UInt32] {
        var array = Array(repeating: UInt32(0), count: count)
        for i in 0..<array.count {
            array[i] = arc4random()
        }
        return array
    }
}
