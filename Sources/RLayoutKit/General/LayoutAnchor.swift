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
    public let superAnchor: Base?
    
    public init(_ base: Base, superAnchor: Base? = nil) {
        self.base = base
        self.superAnchor = superAnchor
    }
}

//public struct AnchorWrapper<AnchorType, Anchor: NSLayoutAnchor<AnchorType>> {
//
//    public let anchor: Anchor
//    public let superAnchor: Anchor?
//
//    public init(_ anchor: Anchor, superAnchor: Anchor? = nil) {
//        self.anchor = anchor
//        self.superAnchor = superAnchor
//    }
//}

public protocol AnchorCompatible {}

extension AnchorCompatible {
    
    /// An instance of type `Self` wrapped with an `AnchorWrapper` container
    // swiftlint:disable identifier_name
    var aw: AnchorWrapper<Self> {
        return AnchorWrapper(self)
    }
    
    func aw(_ superAnchor: Self?) -> AnchorWrapper<Self> {
        return AnchorWrapper(self, superAnchor: superAnchor)
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

public struct AnchorWrappered<AnchorType, Anchor: NSLayoutAnchor<AnchorType>> {
    let anchor: Anchor
    
    init(_ anchor: Anchor) {
        self.anchor = anchor
    }
}

extension AnchorWrappered {
    @discardableResult
    public static func == (lsh: AnchorWrappered,
                           rsh: AnchorWrappered) -> NSLayoutConstraint {
        return lsh.anchor.constraint(equalTo: rsh.anchor)
    }
}

protocol AnchorWrapperedable: class {}

//extension AnchorWrapperedable where Self: AnyObject {
//    var aw: AnchorWrappered<Self, NSLayoutAnchor<Self>> {
//        return .init(self)
//    }
//}

func test() {
    let view = View()
    let leading = view.leadingAnchor
    let anchor = AnchorWrappered(leading)
}

extension RLayoutKitWrapper where Base: View {
    
    public var leading1: AnchorWrappered<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return AnchorWrappered(base.leadingAnchor)
    }
}
