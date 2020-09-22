//
//  LayoutWrappers.swift
//  Equations
//
//  Created by Hans Fehrmann on 21-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import Foundation
import AppKit

public protocol LayoutAnchor {
    func constraint(equalTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
}

public protocol LayoutDimension: LayoutAnchor {
    func constraint(equalToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(equalTo anchor: Self, multiplier m: CGFloat, constant: CGFloat) -> NSLayoutConstraint

    func constraint(greaterThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, multiplier m: CGFloat, constant: CGFloat) -> NSLayoutConstraint

    func constraint(lessThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, multiplier m: CGFloat, constant: CGFloat) -> NSLayoutConstraint
}
