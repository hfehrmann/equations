//
//  ViewProxy.swift
//  Equations
//
//  Created by Hans Fehrmann on 17-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import Foundation
import AppKit

public class ViewProxy {

    private let view: NSView
    private let isActive: Bool

    public lazy var top = LayoutProxy(anchor: self.view.topAnchor, isActive: self.isActive)
    public lazy var bottom = LayoutProxy(anchor: self.view.bottomAnchor, isActive: self.isActive)
    public lazy var centerY = LayoutProxy(anchor: self.view.centerYAnchor, isActive: self.isActive)
    public lazy var firstBaseline = LayoutProxy(anchor: self.view.firstBaselineAnchor, isActive: self.isActive)
    public lazy var lastBaseline = LayoutProxy(anchor: self.view.lastBaselineAnchor, isActive: self.isActive)

    public lazy var leading = LayoutProxy(anchor: self.view.leadingAnchor, isActive: self.isActive)
    public lazy var trailing = LayoutProxy(anchor: self.view.trailingAnchor, isActive: self.isActive)
    public lazy var left = LayoutProxy(anchor: self.view.leftAnchor, isActive: self.isActive)
    public lazy var right = LayoutProxy(anchor: self.view.rightAnchor, isActive: self.isActive)
    public lazy var centerX = LayoutProxy(anchor: self.view.centerXAnchor, isActive: self.isActive)

    public lazy var width = LayoutProxy(anchor: self.view.widthAnchor, isActive: self.isActive)
    public lazy var height = LayoutProxy(anchor: self.view.heightAnchor, isActive: self.isActive)

    init(view: NSView, isActive: Bool) {
        self.view = view
        self.isActive = isActive
    }
}
