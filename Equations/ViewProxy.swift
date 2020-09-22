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

    init(view: NSView) {
        self.view = view
    }
}
