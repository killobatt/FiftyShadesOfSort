//
//  SwiftStandardSortTests.swift
//  FiftyShadesOfSortTests
//
//  Created by Vjacheslav Volodko on 07.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//

import XCTest


class SwiftStandardSortTests: XCTestCase {
    
    var testData = TestData()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testPerformance10() {
        let testArray = testData.testIntegers(count: 10)
        self.measure {
            _ = testArray.sorted(by: <)
        }
    }
    
    func testPerformance100() {
        let testArray = testData.testIntegers(count: 100)
        self.measure {
            _ = testArray.sorted(by: <)
        }
    }
    
    func testPerformance1000() {
        let testArray = testData.testIntegers(count: 1000)
        self.measure {
            _ = testArray.sorted(by: <)
        }
    }
    
    func testPerformance2000() {
        let testArray = testData.testIntegers(count: 2000)
        self.measure {
            _ = testArray.sorted(by: <)
        }
    }
    
    func testPerformance10k() {
        let testArray = testData.testIntegers(count: 10_000)
        self.measure {
            _ = testArray.sorted(by: <)
        }
    }
    
    func testPerformance50k() {
        let testArray = testData.testIntegers(count: 50_000)
        self.measure {
            _ = testArray.sorted(by: <)
        }
    }
    
    func testPerformance1000AlreadySortedIntegers() {
        let testArray = testData.testIntegers(count: 1000)
        let sortedArray = testArray.sorted(by: <)
        self.measure {
            let _ = sortedArray.sorted(by: <)
        }
    }
    
}


