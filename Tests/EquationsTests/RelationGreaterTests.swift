//
//  RelationTests.swift
//  EquationsTests
//
//  Created by Hans Fehrmann on 21-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import XCTest
import AppKit
@testable import Equations

class RelationGreaterTests: XCTestCase {

    var parent: NSView!
    var view: NSView!

    override func setUp() {
        self.parent = NSView()
        self.view = NSView()
        self.view.translatesAutoresizingMaskIntoConstraints = false

        self.parent.addSubview(view)
    }

    func testTopGenerationWithoutConstant() {
        self.view.equations { proxy in
            proxy.top >= self.parent.topAnchor
        }

        if let constraint = self.parent.constraints.first {
            XCTAssertTrue(constraint.firstItem === self.view)
            XCTAssertTrue(constraint.secondItem === self.parent)

            XCTAssertEqual(constraint.firstAttribute, .top)
            XCTAssertEqual(constraint.secondAttribute, .top)

            XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.greaterThanOrEqual)
            XCTAssertEqual(constraint.constant, 0)

            XCTAssertTrue(constraint.isActive)
            XCTAssertEqual(constraint.priority, NSLayoutConstraint.Priority.required)
            XCTAssertEqual(constraint.multiplier, 1)
        } else {
            XCTFail("No constraint was generated")
        }
    }

    func testTopGenerationWithPositiveConstant() {
        self.view.equations { proxy in
            proxy.top >= self.parent.topAnchor + 3
        }

        if let constraint = self.parent.constraints.first {
            XCTAssertTrue(constraint.firstItem === self.view)
            XCTAssertTrue(constraint.secondItem === self.parent)

            XCTAssertEqual(constraint.firstAttribute, .top)
            XCTAssertEqual(constraint.secondAttribute, .top)

            XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.greaterThanOrEqual)
            XCTAssertEqual(constraint.constant, 3)

            XCTAssertTrue(constraint.isActive)
            XCTAssertEqual(constraint.priority, NSLayoutConstraint.Priority.required)
            XCTAssertEqual(constraint.multiplier, 1)
        } else {
            XCTFail("No constraint was generated")
        }
    }

    func testTopGenerationWithNegativeConstant() {
        self.view.equations { proxy in
            proxy.top >= self.parent.topAnchor - 3
        }

        if let constraint = self.parent.constraints.first {
            XCTAssertTrue(constraint.firstItem === self.view)
            XCTAssertTrue(constraint.secondItem === self.parent)

            XCTAssertEqual(constraint.firstAttribute, .top)
            XCTAssertEqual(constraint.secondAttribute, .top)

            XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.greaterThanOrEqual)
            XCTAssertEqual(constraint.constant, -3)

            XCTAssertTrue(constraint.isActive)
            XCTAssertEqual(constraint.priority, NSLayoutConstraint.Priority.required)
            XCTAssertEqual(constraint.multiplier, 1)
        } else {
            XCTFail("No constraint was generated")
        }
    }

    func testDimensionWithMultiplier() {
        self.view.equations { proxy in
            proxy.width >= 2 * self.parent.widthAnchor
        }

        if let constraint = self.parent.constraints.first {
            XCTAssertTrue(constraint.firstItem === self.view)
            XCTAssertTrue(constraint.secondItem === self.parent)

            XCTAssertEqual(constraint.firstAttribute, .width)
            XCTAssertEqual(constraint.secondAttribute, .width)

            XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.greaterThanOrEqual)
            XCTAssertEqual(constraint.constant, 0)

            XCTAssertTrue(constraint.isActive)
            XCTAssertEqual(constraint.priority, NSLayoutConstraint.Priority.required)
            XCTAssertEqual(constraint.multiplier, 2)
        } else {
            XCTFail("No constraint was generated")
        }
    }

    func testDimensionWithMultiplierAndPositiveConstant() {
        self.view.equations { proxy in
            proxy.width >= 2 * self.parent.widthAnchor + 3
        }

        if let constraint = self.parent.constraints.first {
            XCTAssertTrue(constraint.firstItem === self.view)
            XCTAssertTrue(constraint.secondItem === self.parent)

            XCTAssertEqual(constraint.firstAttribute, .width)
            XCTAssertEqual(constraint.secondAttribute, .width)

            XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.greaterThanOrEqual)
            XCTAssertEqual(constraint.constant, 3)

            XCTAssertTrue(constraint.isActive)
            XCTAssertEqual(constraint.priority, NSLayoutConstraint.Priority.required)
            XCTAssertEqual(constraint.multiplier, 2)
        } else {
            XCTFail("No constraint was generated")
        }
    }

    func testDimensionWithMultiplierAndNegativeConstant() {
        self.view.equations { proxy in
            proxy.width >= 2 * self.parent.widthAnchor - 3
        }

        if let constraint = self.parent.constraints.first {
            XCTAssertTrue(constraint.firstItem === self.view)
            XCTAssertTrue(constraint.secondItem === self.parent)

            XCTAssertEqual(constraint.firstAttribute, .width)
            XCTAssertEqual(constraint.secondAttribute, .width)

            XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.greaterThanOrEqual)
            XCTAssertEqual(constraint.constant, -3)

            XCTAssertTrue(constraint.isActive)
            XCTAssertEqual(constraint.priority, NSLayoutConstraint.Priority.required)
            XCTAssertEqual(constraint.multiplier, 2)
        } else {
            XCTFail("No constraint was generated")
        }
    }
}