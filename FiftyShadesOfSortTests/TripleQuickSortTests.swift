//
//  TripleQuickSortTests.swift
//  FiftyShadesOfSortTests
//
//  Created by Vjacheslav Volodko on 10.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//

import XCTest
@testable import FiftyShadesOfSort


class TripleQuickSortTests: XCTestCase {

    var testData = TestData()
    var testAlgo = ArraySortAlgorythmType.tripleQuick

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testEmptyArray() {
        // GIVEN
        let testArray: [Int] = []

        // WHEN
        let sortedArray = testArray.sorted(with: testAlgo, by: <)

        // THEN
        XCTAssertEqual(sortedArray, testArray)
    }
    
    func test1Integer() {
        // GIVEN
        let testArray = testData.test1Integer

        // WHEN
        let sortedArray = testArray.sorted(with: testAlgo, by: <)

        // THEN
        XCTAssertEqual(sortedArray, testArray)
    }

    func test2Integers() {
        // GIVEN
        let testArray = testData.test1Integer
        let targetArray = testArray.sorted(by: <)

        // WHEN
        let sortedArray = testArray.sorted(with: testAlgo, by: <)

        // THEN
        XCTAssertEqual(sortedArray, targetArray)
    }

    func test10Integers() {
        // GIVEN
        let testArray = testData.test10Integers
        let targetArray = testArray.sorted(by: <)

        // WHEN
        let sortedArray = testArray.sorted(with: testAlgo, by: <)

        // THEN
        XCTAssertEqual(sortedArray, targetArray)
    }

    func test100Integers() {
        // GIVEN
        let testArray = testData.testIntegers(count: 100)
        let targetArray = testArray.sorted(by: <)

        // WHEN
        let sortedArray = testArray.sorted(with: testAlgo, by: <)

        // THEN
        XCTAssertEqual(sortedArray, targetArray)
    }

    func testPerformance10() {
        let testArray = testData.testIntegers(count: 10)
        self.measure {
            _ = testArray.sorted(with: testAlgo, by: <)
        }
    }

    func testPerformance100() {
        let testArray = testData.testIntegers(count: 100)
        self.measure {
            _ = testArray.sorted(with: testAlgo, by: <)
        }
    }

    func testPerformance1000() {
        let testArray = testData.testIntegers(count: 1000)
        self.measure {
            _ = testArray.sorted(with: testAlgo, by: <)
        }
    }

    func testPerformance2000() {
        let testArray = testData.testIntegers(count: 2000)
        self.measure {
            _ = testArray.sorted(with: testAlgo, by: <)
        }
    }

    func testPerformance10k() {
        let testArray = testData.testIntegers(count: 10_000)
        self.measure {
            _ = testArray.sorted(with: testAlgo, by: <)
        }
    }

    func testPerformance50k() {
        let testArray = testData.testIntegers(count: 50_000)
        self.measure {
            _ = testArray.sorted(with: testAlgo, by: <)
        }
    }

    func testPerformance1000AlreadySortedIntegers() {
        let testArray = testData.testIntegers(count: 1000)
        let sortedArray = testArray.sorted(by: <)
        self.measure {
            let _ = sortedArray.sorted(with: testAlgo, by: <)
        }
    }

    func testPerformance2000AlreadyBackwardSortedIntegers() {
        let testArray = testData.testIntegers(count: 2000)
        let sortedArray = testArray.sorted(by: >)
        self.measure {
            let _ = sortedArray.sorted(with: testAlgo, by: <)
        }
    }

}

