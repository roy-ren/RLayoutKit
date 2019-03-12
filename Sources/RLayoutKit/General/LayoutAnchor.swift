//
//  LayoutAnchor.swift
//  RLayoutKit
//
//  Created by roy on 2019/3/11.
//

import Foundation

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#endif

/**
 A Structure for containing subclasses of type
 [NSLayoutAnchor](https://developer.apple.com/documentation/uikit/nslayoutconstraint),
 used by combining AnchorCompatible
 - Example
 ````
 extension NSLayoutXAxisAnchor: AnchorCompatible {}
 
 let view = View()
 let anAnchorWrapper: AnchorWrapper<NSLayoutXAxisAnchor> = view.leadingAnchor.anchor
 ````
 */
public struct AnchorWrapper<Base> {
    
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol AnchorCompatible {}

extension AnchorCompatible {
    
    /// An instance of type `Self` wrapped with an `AnchorWrapper` container
    // swiftlint:disable identifier_name
    var aw: AnchorWrapper<Self> {
        return AnchorWrapper<Self>(self)
    }
}

extension AnchorWrapper {
    
    @discardableResult
    public static func + (lsh: AnchorWrapper,
                          rsh: CGFloat) -> BaseLayoutConstrainted<Base> {
        return BaseLayoutConstrainted(anchor: lsh.base, constant: rsh)
    }
    
    @discardableResult
    public static func - (lsh: AnchorWrapper,
                          rsh: CGFloat) -> BaseLayoutConstrainted<Base> {
        return BaseLayoutConstrainted(anchor: lsh.base, constant: -rsh)
    }
    
    @discardableResult
    public static func * (lsh: AnchorWrapper,
                          rsh: CGFloat) -> FulfilledLayoutConstrainted<Base> {
        return FulfilledLayoutConstrainted(anchor: lsh.base, multiplier: rsh, constant: 0)
    }
}
