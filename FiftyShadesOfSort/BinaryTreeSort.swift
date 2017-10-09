//
//  BinaryTreeSort.swift
//  FiftyShadesOfSort
//
//  Created by Vjacheslav Volodko on 10.10.17.
//  Copyright © 2017 FiftyShadesOfSort. All rights reserved.
//


internal func binaryTreeSorted<Element>(array initialArray: [Element],
                                        by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
    let binaryTree = BinaryTree(array: initialArray, comparator: areInIncreasingOrder)
    return binaryTree.walk()
}


fileprivate class BinaryTreeLeaf<Element> {
    var value: Element
    var leftChild: BinaryTreeLeaf<Element>? = nil
    var rightChild: BinaryTreeLeaf<Element>? = nil

    init(_ value: Element,
         leftChild: BinaryTreeLeaf<Element>? = nil,
         rightChild: BinaryTreeLeaf<Element>? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }

    func insert(child: Element, comparator: (Element, Element) -> Bool) {
        if comparator(child, value) {
            if let leftChild = self.leftChild {
                leftChild.insert(child: child, comparator: comparator)
            } else {
                leftChild = BinaryTreeLeaf(child)
            }
        } else {
            if let rightChild = self.rightChild {
                rightChild.insert(child: child, comparator: comparator)
            } else {
                rightChild = BinaryTreeLeaf(child)
            }
        }
    }

    func walk() -> [Element] {
        var array: [Element] = []
        array.append(contentsOf: leftChild?.walk() ?? [])
        array.append(value)
        array.append(contentsOf: rightChild?.walk() ?? [])
        return array
    }
}


fileprivate class BinaryTree<Element> {
    var rootLeaf: BinaryTreeLeaf<Element>? = nil

    init(array: [Element], comparator: (Element, Element) -> Bool) {
        guard !array.isEmpty else {
            return
        }

        let rootLeaf = BinaryTreeLeaf(array[0])
        for i in 1..<array.count {
            rootLeaf.insert(child: array[i], comparator: comparator)
        }
        self.rootLeaf = rootLeaf
    }

    func walk() -> [Element] {
        return rootLeaf?.walk() ?? []
    }
}

