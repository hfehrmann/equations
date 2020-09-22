//
//  AnchorTests.swift
//  EquationsTests
//
//  Created by Hans Fehrmann on 19-09-20.
//  Copyright © 2020 Fehrmann Inc. All rights reserved.
//

import XCTest
import AppKit
@testable import Equations

class AnchorTests: XCTestCase {

    var parent: NSView!
    var view: NSView!

    override func setUp() {
        self.parent = NSView()
        self.view = NSView()
        self.view.translatesAutoresizingMaskIntoConstraints = false

        self.parent.addSubview(view)
    }


    func testVertical() {
        let anchors = [
            self.parent.topAnchor,
            self.parent.bottomAnchor,
            self.parent.centerYAnchor,
        ]

        let proxyAnchorsBuilder = { (proxy: ViewProxy) -> [LayoutProxy<NSLayoutYAxisAnchor>] in
            [
                proxy.top,
                proxy.bottom,
                proxy.centerY,
            ]
        }

        view.equations {
            let proxyAnchors = proxyAnchorsBuilder($0)
            for anchor in anchors {
                for proxyAnchor in proxyAnchors {
                    proxyAnchor == anchor
                }
            }
        }
    }
}
