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


//struct W<A: AnyObject, B: NSLayoutAnchor<A>, A: B> {
//
//}

protocol P {
    associatedtype A: AnyObject
    associatedtype B: NSLayoutAnchor<A>
    
    var b: B { get }
}

struct Anchor<A, B: NSLayoutAnchor<A>>: P {
    var b: B
}

//extension P where A: NSLayoutXAxisAnchor {
//    static func == (lsh: Self, rsh: Self) -> NSLayoutConstraint {
//        return lsh.a.constraint(equalTo: rsh.a)
//    }
//}

extension P {
    static func == (lsh: Self, rsh: Self) -> NSLayoutConstraint {
        return lsh.b.constraint(equalTo: rsh.b)
    }
}

extension P where A == NSLayoutDimension, B == NSLayoutDimension {
    static func == (lsh: Self, rsh: CGFloat) -> NSLayoutConstraint {
        lsh.b.constraint(equalToConstant: rsh)
    }
}

extension P where A == NSLayoutXAxisAnchor, B == NSLayoutXAxisAnchor {
    static func == (lsh: Self, rsh: Self) -> NSLayoutDimension {
        return lsh.b.anchorWithOffset(to: rsh.b)
    }
}

func test() {
    let view = View()
    let anchor = Anchor(b: view.leadingAnchor)
    let anchor2 = Anchor(b: view.leadingAnchor)
    anchor == anchor2
    
    let width = Anchor(b: view.widthAnchor)
    width == 100
}



//extension NSLayoutXAxisAnchor: P {
////    typealias B = <#type#>
//
////    typealias B = NSLayoutAnchor<NSLayoutXAxisAnchor>
//
//    var a: NSLayoutXAxisAnchor {
//        return self
//    }
//}


