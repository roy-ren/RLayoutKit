//
//  LayoutSize.swift
//  RLayoutKit
//
//  Created by roy on 2019/3/12.
//

import Foundation

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#endif

@available(iOS 9.0, *)
public struct LayoutSize {
    
    let width: AnchorWrapper<NSLayoutDimension>
    let height: AnchorWrapper<NSLayoutDimension>
}

@available(iOS 9.0, *)
extension LayoutSize {
    
    @discardableResult
    public static func == (lsh: LayoutSize, rsh: CGSize) -> [NSLayoutConstraint] {
        return [lsh.width == rsh.width,
                lsh.height == rsh.height]
    }
    
    @discardableResult
    public static func >= (lsh: LayoutSize, rsh: CGSize) -> [NSLayoutConstraint] {
        return [lsh.width >= rsh.width,
                lsh.height >= rsh.height]
    }
    
    @discardableResult
    public static func <= (lsh: LayoutSize, rsh: CGSize) -> [NSLayoutConstraint] {
        return [lsh.width <= rsh.width,
                lsh.height <= rsh.height]
    }
}

@available(iOS 9.0, *)
extension LayoutSize {
    
    @discardableResult
    public static func == (lsh: LayoutSize, rsh: LayoutSize) -> [NSLayoutConstraint] {
        return [lsh.width == rsh.width,
                lsh.height == rsh.height]
    }
    
    @discardableResult
    public static func == (lsh: LayoutSize, rsh: LayoutInsetsSize) -> [NSLayoutConstraint] {
        return [lsh.width == rsh.width,
                lsh.height == rsh.height]
    }
    
    @discardableResult
    public static func == (lsh: LayoutSize, rsh: LayoutInsetsFulfilledSize) -> [NSLayoutConstraint] {
        return [lsh.width == rsh.width,
                lsh.height == rsh.height]
    }
}

@available(iOS 9.0, *)
extension LayoutSize {
    
    public static func + (lsh: LayoutSize, rsh: CGSize) -> LayoutInsetsSize {
        return LayoutInsetsSize(width: lsh.width + rsh.width,
                                height: lsh.height + rsh.height)
    }
    
    public static func - (lsh: LayoutSize, rsh: CGSize) -> LayoutInsetsSize {
        return LayoutInsetsSize(width: lsh.width - rsh.width,
                                height: lsh.height - rsh.height)
    }
    
    public static func * (lsh: LayoutSize, rsh: CGFloat) -> LayoutInsetsFulfilledSize {
        return LayoutInsetsFulfilledSize(width: lsh.width * rsh,
                                         height: lsh.height * rsh)
    }
}

@available(iOS 9.0, *)
public struct LayoutInsetsSize {
    
    let width: BaseLayoutConstrainted<NSLayoutDimension>
    let height: BaseLayoutConstrainted<NSLayoutDimension>
}

@available(iOS 9.0, *)
extension LayoutInsetsSize {
    
    public static func + (lsh: LayoutInsetsSize, rsh: CGSize) -> LayoutInsetsSize {
        return LayoutInsetsSize(width: lsh.width + rsh.width,
                                height: lsh.height + rsh.height)
    }
    
    public static func - (lsh: LayoutInsetsSize, rsh: CGSize) -> LayoutInsetsSize {
        return LayoutInsetsSize(width: lsh.width - rsh.width,
                                height: lsh.height - rsh.height)
    }
    
    public static func * (lsh: LayoutInsetsSize, rsh: CGFloat) -> LayoutInsetsFulfilledSize {
        return LayoutInsetsFulfilledSize(width: lsh.width * rsh,
                                         height: lsh.height * rsh)
    }
}

@available(iOS 9.0, *)
public struct LayoutInsetsFulfilledSize {
    
    let width: FulfilledLayoutConstrainted<NSLayoutDimension>
    let height: FulfilledLayoutConstrainted<NSLayoutDimension>
}

@available(iOS 9.0, *)
extension LayoutInsetsFulfilledSize {
    
    public static func + (lsh: LayoutInsetsFulfilledSize, rsh: CGSize) -> LayoutInsetsFulfilledSize {
        return LayoutInsetsFulfilledSize(width: lsh.width + rsh.width,
                                         height: lsh.height + rsh.height)
    }
    
    public static func - (lsh: LayoutInsetsFulfilledSize, rsh: CGSize) -> LayoutInsetsFulfilledSize {
        return LayoutInsetsFulfilledSize(width: lsh.width - rsh.width,
                                         height: lsh.height - rsh.height)
    }
    
    public static func * (lsh: LayoutInsetsFulfilledSize, rsh: CGFloat) -> LayoutInsetsFulfilledSize {
        return LayoutInsetsFulfilledSize(width: lsh.width * rsh,
                                         height: lsh.height * rsh)
    }
}

@available(iOS 9.0, *)
extension RLayoutKitWrapper where Base: View {
    
    public var size: LayoutSize {
        return LayoutSize(width: width,
                        height: height)
    }
}

#if os(iOS)

@available(iOS 11.0, *)
extension RLayoutKitWrapper where Base: UIScrollView {
    
    public var contentSize: LayoutSize {
        return LayoutSize(width: contentWidth,
                          height: contentHeight)
    }
}
#endif
