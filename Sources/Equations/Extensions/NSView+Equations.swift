//
//  NSView+Equations.swift
//  Equations
//
//  Created by Hans Fehrmann on 17-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public extension EquationView {

    func equations(_ equationsGeneration: (ViewProxy) -> Void) {
        equationsGeneration(ViewProxy(view: self, isActive: true))
    }

    func equateConstraint(_ equationsGeneration: (ViewProxy) -> NSLayoutConstraint) -> NSLayoutConstraint {
        return equationsGeneration(ViewProxy(view: self, isActive: false))
    }
}
