//
//  GenerationTests.swift
//  EquationsTests
//
//  Created by Hans Fehrmann on 21-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import XCTest
import AppKit
@testable import Equations

class GenerationTests: XCTestCase {

    var parent: NSView!
    var view: NSView!

    override func setUp() {
        self.parent = NSView()
        self.view = NSView()
        self.view.translatesAutoresizingMaskIntoConstraints = false

        self.parent.addSubview(view)
    }

    func testConstraintGeneration() {
        let constraint = self.view.equateConstraint { $0.top == self.parent.topAnchor }
        XCTAssertFalse(constraint.isActive)
        XCTAssertEqual(constraint.priority, NSLayoutConstraint.Priority.required)
    }

    func testConstraintGenerationWithPriority() {
        let constraint = self.view.equateConstraint { $0.top.with(priority: 600) == self.parent.topAnchor }

        XCTAssertFalse(constraint.isActive)
        XCTAssertEqual(constraint.priority, NSLayoutConstraint.Priority(600))
    }

}
