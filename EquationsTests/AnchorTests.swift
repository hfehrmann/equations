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
            self.parent.firstBaselineAnchor,
            self.parent.lastBaselineAnchor,
        ]

        let proxyAnchorsBuilder = { (proxy: ViewProxy) -> [LayoutProxy<NSLayoutYAxisAnchor>] in
            [
                proxy.top,
                proxy.bottom,
                proxy.centerY,
                proxy.firstBaseline,
                proxy.lastBaseline,
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

        XCTAssertEqual(parent.constraints.count, 25)
    }

    func testVerticalWithConstants() {
        let anchors = [
            self.parent.topAnchor,
            self.parent.bottomAnchor,
            self.parent.centerYAnchor,
            self.parent.firstBaselineAnchor,
            self.parent.lastBaselineAnchor,
        ]

        let proxyAnchorsBuilder = { (proxy: ViewProxy) -> [LayoutProxy<NSLayoutYAxisAnchor>] in
            [
                proxy.top,
                proxy.bottom,
                proxy.centerY,
                proxy.firstBaseline,
                proxy.lastBaseline,
            ]
        }

        view.equations {
            let proxyAnchors = proxyAnchorsBuilder($0)
            for anchor in anchors {
                for proxyAnchor in proxyAnchors {
                    proxyAnchor == anchor + 1
                    proxyAnchor == anchor - 1
                }
            }
        }

        XCTAssertEqual(parent.constraints.count, 50)
    }

    func testHorizontalLeftRight() {
        let anchors = [
            self.parent.leftAnchor,
            self.parent.rightAnchor,
            self.parent.centerXAnchor,
        ]

        let proxyAnchorsBuilder = { (proxy: ViewProxy) -> [LayoutProxy<NSLayoutXAxisAnchor>] in
            [
                proxy.left,
                proxy.right,
                proxy.centerX,
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

        XCTAssertEqual(parent.constraints.count, 9)
    }

    func testHorizontalLeftRightWithConstants() {
        let anchors = [
            self.parent.leftAnchor,
            self.parent.rightAnchor,
            self.parent.centerXAnchor,
        ]

        let proxyAnchorsBuilder = { (proxy: ViewProxy) -> [LayoutProxy<NSLayoutXAxisAnchor>] in
            [
                proxy.left,
                proxy.right,
                proxy.centerX,
            ]
        }

        view.equations {
            let proxyAnchors = proxyAnchorsBuilder($0)
            for anchor in anchors {
                for proxyAnchor in proxyAnchors {
                    proxyAnchor == anchor + 1
                    proxyAnchor == anchor - 1
                }
            }
        }

        XCTAssertEqual(parent.constraints.count, 18)
    }

    func testHorizontalLeadingTrailing() {
        let anchors = [
            self.parent.leadingAnchor,
            self.parent.trailingAnchor,
            self.parent.centerXAnchor,
        ]

        let proxyAnchorsBuilder = { (proxy: ViewProxy) -> [LayoutProxy<NSLayoutXAxisAnchor>] in
            [
                proxy.leading,
                proxy.trailing,
                proxy.centerX,
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

        XCTAssertEqual(parent.constraints.count, 9)
    }

    func testHorizontalLeadingTrailingWithConstants() {
        let anchors = [
            self.parent.leadingAnchor,
            self.parent.trailingAnchor,
            self.parent.centerXAnchor,
        ]

        let proxyAnchorsBuilder = { (proxy: ViewProxy) -> [LayoutProxy<NSLayoutXAxisAnchor>] in
            [
                proxy.leading,
                proxy.trailing,
                proxy.centerX,
            ]
        }

        view.equations {
            let proxyAnchors = proxyAnchorsBuilder($0)
            for anchor in anchors {
                for proxyAnchor in proxyAnchors {
                    proxyAnchor == anchor + 1
                    proxyAnchor == anchor - 1
                }
            }
        }

        XCTAssertEqual(parent.constraints.count, 18)
    }

    func testDimensions() {
        let anchors = [
            self.parent.widthAnchor,
            self.parent.heightAnchor,
        ]

        let proxyAnchorsBuilder = { (proxy: ViewProxy) -> [LayoutProxy<NSLayoutDimension>] in
            [
                proxy.width,
                proxy.height,
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

        XCTAssertEqual(parent.constraints.count, 4)
    }

    func testDimensionsWithConstants() {
        let anchors = [
            self.parent.widthAnchor,
            self.parent.heightAnchor,
        ]

        let proxyAnchorsBuilder = { (proxy: ViewProxy) -> [LayoutProxy<NSLayoutDimension>] in
            [
                proxy.width,
                proxy.height,
            ]
        }

        view.equations {
            let proxyAnchors = proxyAnchorsBuilder($0)
            for anchor in anchors {
                for proxyAnchor in proxyAnchors {
                    proxyAnchor == anchor + 1
                    proxyAnchor == anchor - 1
                }
            }
        }

        XCTAssertEqual(parent.constraints.count, 8)
    }

    func testDimensionsToConstant() {
        view.equations {
            $0.width == 1
            $0.height == 1
        }

        XCTAssertEqual(parent.constraints.count, 2)
    }
}
