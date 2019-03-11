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
public struct RLayoutKitWapper<Base> {
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
    public var rl: RLayoutKitWapper<Self> {
        return RLayoutKitWapper<Self>(self)
    }
}

extension RLayoutKitWapper where Base: View {
	
	/// Method of adding constraints to package base(View) of RLayoutKitWapper
	///
	/// - Parameter constrainHandler: adding constraints closure
	/// - Returns: base(View)
	@discardableResult
	public func layout(_ constrainHandler: (RLayoutKitWapper<Base>) -> Void) -> Base {
		constrainHandler(base.rl)
		return base
	}
}

extension RLayoutKitWapper where Base: View {

	public var leading: AnchorWapper<NSLayoutXAxisAnchor> {
		return base.leadingAnchor.anchor
	}
	
	public var trailing: AnchorWapper<NSLayoutXAxisAnchor> {
		return base.trailingAnchor.anchor
	}
	
	public var left: AnchorWapper<NSLayoutXAxisAnchor> {
		return base.leftAnchor.anchor
	}
	
	public var right: AnchorWapper<NSLayoutXAxisAnchor> {
		return base.rightAnchor.anchor
	}
	
	public var top: AnchorWapper<NSLayoutYAxisAnchor> {
		return base.topAnchor.anchor
	}
	
	public var bottom: AnchorWapper<NSLayoutYAxisAnchor> {
		return base.bottomAnchor.anchor
	}
	
	public var width: AnchorWapper<NSLayoutDimension> {
		return base.widthAnchor.anchor
	}
	
	public var height: AnchorWapper<NSLayoutDimension> {
		return base.heightAnchor.anchor
	}
	
	public var centerX: AnchorWapper<NSLayoutXAxisAnchor> {
		return base.centerXAnchor.anchor
	}
	
	public var centerY: AnchorWapper<NSLayoutYAxisAnchor> {
		return base.centerYAnchor.anchor
	}
	
	public var firstBaseline: AnchorWapper<NSLayoutYAxisAnchor> {
		return base.firstBaselineAnchor.anchor
	}
	
	public var lastBaseline: AnchorWapper<NSLayoutYAxisAnchor> {
		return base.lastBaselineAnchor.anchor
	}
}

#if os(iOS)
extension RLayoutKitWapper where Base: View {
	var marginsGuide: UILayoutGuide {
		return base.layoutMarginsGuide
	}
	
	public var marginsLeading: AnchorWapper<NSLayoutXAxisAnchor> {
		return marginsGuide.leadingAnchor.anchor
	}
	
	public var marginsTrailing: AnchorWapper<NSLayoutXAxisAnchor> {
		return marginsGuide.trailingAnchor.anchor
	}
	
	public var marginsLeft: AnchorWapper<NSLayoutXAxisAnchor> {
		return marginsGuide.leftAnchor.anchor
	}
	
	public var marginsRight: AnchorWapper<NSLayoutXAxisAnchor> {
		return marginsGuide.rightAnchor.anchor
	}
	
	public var marginsTop: AnchorWapper<NSLayoutYAxisAnchor> {
		return marginsGuide.topAnchor.anchor
	}
	
	public var marginsBottom: AnchorWapper<NSLayoutYAxisAnchor> {
		return marginsGuide.bottomAnchor.anchor
	}
	
	public var marginsWidth: AnchorWapper<NSLayoutDimension> {
		return marginsGuide.widthAnchor.anchor
	}
	
	public var marginsHeight: AnchorWapper<NSLayoutDimension> {
		return marginsGuide.heightAnchor.anchor
	}
	
	public var marginsCenterX: AnchorWapper<NSLayoutXAxisAnchor> {
		return marginsGuide.centerXAnchor.anchor
	}
	
	public var marginsCenterY: AnchorWapper<NSLayoutYAxisAnchor> {
		return marginsGuide.centerYAnchor.anchor
	}
}

extension RLayoutKitWapper where Base: View {
	var safeAreaGuide: UILayoutGuide {
		return base.layoutMarginsGuide
	}
	
	public var safeAreaLeading: AnchorWapper<NSLayoutXAxisAnchor> {
		return safeAreaGuide.leadingAnchor.anchor
	}
	
	public var safeAreaTrailing: AnchorWapper<NSLayoutXAxisAnchor> {
		return safeAreaGuide.trailingAnchor.anchor
	}
	
	public var safeAreaLeft: AnchorWapper<NSLayoutXAxisAnchor> {
		return safeAreaGuide.leftAnchor.anchor
	}
	
	public var safeAreaRight: AnchorWapper<NSLayoutXAxisAnchor> {
		return safeAreaGuide.rightAnchor.anchor
	}
	
	public var safeAreaTop: AnchorWapper<NSLayoutYAxisAnchor> {
		return safeAreaGuide.topAnchor.anchor
	}
	
	public var safeAreaBottom: AnchorWapper<NSLayoutYAxisAnchor> {
		return safeAreaGuide.bottomAnchor.anchor
	}
	
	public var safeAreaWidth: AnchorWapper<NSLayoutDimension> {
		return safeAreaGuide.widthAnchor.anchor
	}
	
	public var safeAreaHeight: AnchorWapper<NSLayoutDimension> {
		return safeAreaGuide.heightAnchor.anchor
	}
	
	public var safeAreaCenterX: AnchorWapper<NSLayoutXAxisAnchor> {
		return safeAreaGuide.centerXAnchor.anchor
	}
	
	public var safeAreaCenterY: AnchorWapper<NSLayoutYAxisAnchor> {
		return safeAreaGuide.centerYAnchor.anchor
	}
}
#endif
