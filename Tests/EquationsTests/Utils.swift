//
//  File.swift
//
//
//  Created by Hans Fehrmann on 13-11-20.
//

import Foundation

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

@testable import Equations

protocol TestableEquationView: AnyObject, EquationView {
    var translatesAutoresizingMaskIntoConstraints: Bool { get set }
    var constraints: [NSLayoutConstraint] { get }
    func addSubview(_ view: TestableEquationView)
}

#if canImport(UIKit)

func createPriority(_ priority: UILayoutPriority) -> UILayoutPriority {
    return priority
}

func createPriority(_ priority: Float) -> UILayoutPriority {
    return UILayoutPriority(priority)
}

extension UIView: TestableEquationView {
    func addSubview(_ view: TestableEquationView) {
        if let view = view as? UIView {
            self.addSubview(view)
        }
    }
}

func createView() -> TestableEquationView {
    return UIView()
}
#elseif canImport(AppKit)

func createPriority(_ priority: NSLayoutConstraint.Priority) -> NSLayoutConstraint.Priority {
    return priority
}

func createPriority(_ priority: Float) -> NSLayoutConstraint.Priority {
    return NSLayoutConstraint.Priority(priority)
}


extension NSView: TestableEquationView {
    func addSubview(_ view: TestableEquationView) {
        if let view = view as? NSView {
            self.addSubview(view)
        }
    }
}

func createView() -> TestableEquationView {
    return NSView()
}
#endif
