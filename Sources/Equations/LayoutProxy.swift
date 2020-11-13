//
//  LayoutProxy.swift
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

public struct LayoutProxy<Anchor> {
    let anchor: Anchor
    let isActive: Bool
    let priority: Float

    init(anchor: Anchor, isActive: Bool) {
        self.anchor = anchor
        self.isActive = isActive
        self.priority = 1000
    }

    fileprivate init(anchor: Anchor, isActive: Bool, priority: Float) {
        self.anchor = anchor
        self.isActive = isActive
        self.priority = priority
    }
}

public extension LayoutProxy {

    func with(priority: Float) -> LayoutProxy<Anchor> {
        return LayoutProxy(anchor: self.anchor, isActive: self.isActive, priority: priority)
    }

}

extension LayoutProxy {

    func createConstraint(with completion: (Anchor) -> NSLayoutConstraint) -> NSLayoutConstraint {
        let constraint = completion(self.anchor)

        #if canImport(UIKit)
        constraint.priority = UILayoutPriority(self.priority)
        #elseif canImport(AppKit)
        constraint.priority = NSLayoutConstraint.Priority(self.priority)
        #endif

        constraint.isActive = self.isActive
        return constraint
    }
}
