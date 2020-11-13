//
//  Equations+Greater.swift
//  Equations
//
//  Created by Hans Fehrmann on 21-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import CoreGraphics

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

@discardableResult
public func >=<A: LayoutAnchor>(_ lhs: LayoutProxy<A>, rhs: A) -> NSLayoutConstraint {
    return lhs.createConstraint { $0.constraint(greaterThanOrEqualTo: rhs, constant: 0) }
}

@discardableResult
public func >=<A: LayoutAnchor>(_ lhs: LayoutProxy<A>, rhs: LayoutConfiguration<A>) -> NSLayoutConstraint {
    return lhs.createConstraint { $0.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant) }
}

// MARK: - Dimension API

@discardableResult
public func >=<A: LayoutDimension>(_ lhs: LayoutProxy<A>, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.createConstraint { $0.constraint(greaterThanOrEqualToConstant: rhs) }
}

@discardableResult
public func >=<A: LayoutDimension>(_ lhs: LayoutProxy<A>, rhs: LayoutConfiguration<A>) -> NSLayoutConstraint {
    return lhs.createConstraint {
        $0.constraint(greaterThanOrEqualTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    }
}
