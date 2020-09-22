//
//  Equations+Equal.swift
//  Equations
//
//  Created by Hans Fehrmann on 21-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import Foundation
import AppKit

@discardableResult
public func ==<A: LayoutAnchor>(_ lhs: LayoutProxy<A>, rhs: A) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(equalTo: rhs, constant: 0)
    constraint.isActive = lhs.isActive
    return constraint
}

@discardableResult
public func ==<A: LayoutAnchor>(_ lhs: LayoutProxy<A>, rhs: LayoutConfiguration<A>) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(equalTo: rhs.anchor, constant: rhs.constant)
    constraint.isActive = lhs.isActive
    return constraint
}

// MARK:- Dimension API

@discardableResult
public func ==<A: LayoutDimension>(_ lhs: LayoutProxy<A>, rhs: CGFloat) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(equalToConstant: rhs)
    constraint.isActive = lhs.isActive
    return constraint
}

@discardableResult
public func ==<A: LayoutDimension>(_ lhs: LayoutProxy<A>, rhs: LayoutConfiguration<A>) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(equalTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    constraint.isActive = lhs.isActive
    return constraint
}
