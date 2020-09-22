//
//  NSView+Equations.swift
//  Equations
//
//  Created by Hans Fehrmann on 17-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import Foundation
import AppKit

public extension NSView {

    func equations(_ equationsGeneration: (ViewProxy) -> Void) {
        equationsGeneration(ViewProxy(view: self))
    }
}
