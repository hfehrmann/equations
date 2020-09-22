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

public func ==(_ lhs: LayoutProxy, rhs: NSLayoutYAxisAnchor) {
    
}

public func ==(_ lhs: LayoutProxy, rhs: (NSLayoutYAxisAnchor, CGFloat)) {

}

