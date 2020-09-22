//
//  Equations.swift
//  Equations
//
//  Created by Hans Fehrmann on 17-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import Foundation
import AppKit

public func +(_ lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> (NSLayoutYAxisAnchor, CGFloat) {
    return (lhs, rhs)
}

public func -(_ lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> (NSLayoutYAxisAnchor, CGFloat)  {
    return (lhs, -rhs)
}

@discardableResult
public func ==<A: LayoutAnchor>(_ lhs: LayoutProxy<A>, rhs: A) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(equalTo: rhs, constant: 0)
    constraint.isActive = true
    return constraint
}

@discardableResult
public func ==<A: LayoutAnchor>(_ lhs: LayoutProxy<A>, rhs: (A, CGFloat)) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(equalTo: rhs.0, constant: rhs.1)
    constraint.isActive = true
    return constraint
}

