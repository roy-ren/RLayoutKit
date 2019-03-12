//
//  RLayoutKit.swift
//  RLayoutKit
//
//  Created by roy on 2019/3/10.
//

import Foundation

#if os(macOS)
import AppKit
public typealias View = NSView
#elseif os(iOS)
import UIKit
public typealias View = UIView
#endif

/**
 A Structure for containing UIView or NSView, used by combining RLayoutCompatible
 
 - Example
 ````
 extension UIView: RLayoutCompatible {}
 
 let view = UIView()
 let aWapper: RLayoutKitWapper<UIView> = view.rl
 ````
 */
public struct RLayoutKitWrapper<Base> {
    
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

/**
 A protocol followed by UIView or NSView
 
 - Example
 ````
 extension UIView: RLayoutCompatible {}
 
 let view = UIView()
 let aWapper: RLayoutKitWapper<UIView> = view.rl
 ````
 */
public protocol RLayoutCompatible {}

extension View: RLayoutCompatible {}

extension RLayoutCompatible {
    
    /// An instance of type `Self` wrapped with an `RLayoutKitWapper` container
    // swiftlint:disable identifier_name
    public var rl: RLayoutKitWrapper<Self> {
        return RLayoutKitWrapper<Self>(self)
    }
}

extension RLayoutKitWrapper where Base: View {
    
    /// Method of adding constraints to package base(View) of RLayoutKitWapper
    ///
    /// - Parameter constrainHandler: adding constraints closure
    /// - Returns: base(View)
    @discardableResult
    public func layout(_ constrainHandler: (RLayoutKitWrapper) -> Void) -> Base {
        base.translatesAutoresizingMaskIntoConstraints = false
        constrainHandler(base.rl)
        return base
    }
}
