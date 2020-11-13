//
//  LayoutConfiguration.swift
//  Equations
//
//  Created by Hans Fehrmann on 21-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import CoreGraphics

public struct LayoutConfiguration<A: LayoutAnchor> {
    let anchor: A
    let multiplier: CGFloat
    let constant: CGFloat

    init(anchor: A, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        self.anchor = anchor
        self.multiplier = multiplier
        self.constant = constant
    }
}
