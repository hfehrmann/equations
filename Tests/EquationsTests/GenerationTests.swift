//
//  GenerationTests.swift
//  EquationsTests
//
//  Created by Hans Fehrmann on 21-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import XCTest

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

@testable import Equations

class GenerationTests: XCTestCase {

    var parent: TestableEquationView!
    var view: TestableEquationView!

    override func setUp() {
        self.parent = createView()
        self.view = createView()
        self.view.translatesAutoresizingMaskIntoConstraints = false

        self.parent.addSubview(view)
    }

    func testConstraintGeneration() {
        let constraint = self.view.equateConstraint { $0.top == self.parent.topAnchor }
        XCTAssertFalse(constraint.isActive)
        XCTAssertEqual(constraint.priority, createPriority(.required))
    }

    func testConstraintGenerationWithPriority() {
        let constraint = self.view.equateConstraint { $0.top.with(priority: 600) == self.parent.topAnchor }

        XCTAssertFalse(constraint.isActive)
        XCTAssertEqual(constraint.priority, createPriority(600))
    }

}
