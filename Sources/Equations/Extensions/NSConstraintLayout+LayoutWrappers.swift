//
//  NSConstraintLayout+LayoutWrappers.swift
//  Equations
//
//  Created by Hans Fehrmann on 21-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension NSLayoutAnchor: LayoutAnchor { }
extension NSLayoutAnchor: LayoutAnchorLanguageAware { }
extension NSLayoutAnchor: LayoutAnchorRealAware { }
extension NSLayoutDimension: LayoutDimension { }
