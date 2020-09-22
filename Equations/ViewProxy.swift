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

    public lazy var top = LayoutProxy(anchor: self.view.topAnchor)
    public lazy var bottom = LayoutProxy(anchor: self.view.bottomAnchor)
    public lazy var centerY = LayoutProxy(anchor: self.view.centerYAnchor)
    public lazy var firstBaseline = LayoutProxy(anchor: self.view.firstBaselineAnchor)
    public lazy var lastBaseline = LayoutProxy(anchor: self.view.lastBaselineAnchor)

    public lazy var leading = LayoutProxy(anchor: self.view.leadingAnchor)
    public lazy var trailing = LayoutProxy(anchor: self.view.trailingAnchor)
    public lazy var left = LayoutProxy(anchor: self.view.leftAnchor)
    public lazy var right = LayoutProxy(anchor: self.view.rightAnchor)
    public lazy var centerX = LayoutProxy(anchor: self.view.centerXAnchor)

    public lazy var width = LayoutProxy(anchor: self.view.widthAnchor)
    public lazy var height = LayoutProxy(anchor: self.view.heightAnchor)

    init(view: NSView) {
        self.view = view
    }
}
