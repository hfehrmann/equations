//
//  Equations.swift
//  Equations
//
//  Created by Hans Fehrmann on 17-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import Foundation
import AppKit

public struct LayoutConfiguration<A: LayoutAnchor> {
    fileprivate let anchor: A
    fileprivate let multiplier: CGFloat
    fileprivate let constant: CGFloat

    fileprivate init(anchor: A, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        self.anchor = anchor
        self.multiplier = multiplier
        self.constant = constant
    }
}

public func +<A: LayoutAnchor>(_ lhs: A, rhs: CGFloat) -> LayoutConfiguration<A>  {
    return LayoutConfiguration(anchor: lhs, constant: rhs)
}

public func -<A: LayoutAnchor>(_ lhs: A, rhs: CGFloat) -> LayoutConfiguration<A> {
    return LayoutConfiguration(anchor: lhs, constant: -rhs)
}

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

@discardableResult
public func <=<A: LayoutAnchor>(_ lhs: LayoutProxy<A>, rhs: A) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(lessThanOrEqualTo: rhs, constant: 0)
    constraint.isActive = lhs.isActive
    return constraint
}

@discardableResult
public func <=<A: LayoutAnchor>(_ lhs: LayoutProxy<A>, rhs: LayoutConfiguration<A>) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    constraint.isActive = lhs.isActive
    return constraint
}

@discardableResult
public func >=<A: LayoutAnchor>(_ lhs: LayoutProxy<A>, rhs: A) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(greaterThanOrEqualTo: rhs, constant: 0)
    constraint.isActive = lhs.isActive
    return constraint
}

@discardableResult
public func >=<A: LayoutAnchor>(_ lhs: LayoutProxy<A>, rhs: LayoutConfiguration<A>) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    constraint.isActive = lhs.isActive
    return constraint
}


// MARK:- Special Dimension API

public func *<A: LayoutDimension>(_ lhs: CGFloat, rhs: A) -> LayoutConfiguration<A> {
    return LayoutConfiguration(anchor: rhs, multiplier: lhs)
}

public func +<A: LayoutDimension>(_ lhs: LayoutConfiguration<A>, rhs: CGFloat) -> LayoutConfiguration<A>  {
    return LayoutConfiguration(anchor: lhs.anchor, multiplier: lhs.multiplier, constant: rhs)
}

public func -<A: LayoutDimension>(_ lhs: LayoutConfiguration<A>, rhs: CGFloat) -> LayoutConfiguration<A>  {
    return LayoutConfiguration(anchor: lhs.anchor, multiplier: lhs.multiplier, constant: -rhs)
}

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

@discardableResult
public func <=<A: LayoutDimension>(_ lhs: LayoutProxy<A>, rhs: CGFloat) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(lessThanOrEqualToConstant: rhs)
    constraint.isActive = lhs.isActive
    return constraint
}

@discardableResult
public func <=<A: LayoutDimension>(_ lhs: LayoutProxy<A>, rhs: LayoutConfiguration<A>) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(
        lessThanOrEqualTo: rhs.anchor,
        multiplier: rhs.multiplier,
        constant: rhs.constant
    )
    constraint.isActive = lhs.isActive
    return constraint
}

@discardableResult
public func >=<A: LayoutDimension>(_ lhs: LayoutProxy<A>, rhs: CGFloat) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(greaterThanOrEqualToConstant: rhs)
    constraint.isActive = lhs.isActive
    return constraint
}

@discardableResult
public func >=<A: LayoutDimension>(_ lhs: LayoutProxy<A>, rhs: LayoutConfiguration<A>) -> NSLayoutConstraint {
    let constraint = lhs.anchor.constraint(
        greaterThanOrEqualTo: rhs.anchor,
        multiplier: rhs.multiplier,
        constant: rhs.constant
    )
    constraint.isActive = lhs.isActive
    return constraint
}
