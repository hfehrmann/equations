//
//  Equations+Operation.swift
//  Equations
//
//  Created by Hans Fehrmann on 21-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import Foundation

public func +<A: LayoutAnchor>(_ lhs: A, rhs: CGFloat) -> LayoutConfiguration<A> {
    return LayoutConfiguration(anchor: lhs, constant: rhs)
}

public func -<A: LayoutAnchor>(_ lhs: A, rhs: CGFloat) -> LayoutConfiguration<A> {
    return LayoutConfiguration(anchor: lhs, constant: -rhs)
}

// MARK: - Dimension API

public func *<A: LayoutDimension>(_ lhs: CGFloat, rhs: A) -> LayoutConfiguration<A> {
    return LayoutConfiguration(anchor: rhs, multiplier: lhs)
}

public func +<A: LayoutDimension>(_ lhs: LayoutConfiguration<A>, rhs: CGFloat) -> LayoutConfiguration<A> {
    return LayoutConfiguration(anchor: lhs.anchor, multiplier: lhs.multiplier, constant: rhs)
}

public func -<A: LayoutDimension>(_ lhs: LayoutConfiguration<A>, rhs: CGFloat) -> LayoutConfiguration<A> {
    return LayoutConfiguration(anchor: lhs.anchor, multiplier: lhs.multiplier, constant: -rhs)
}
