//
//  LayoutPoint.swift
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

// swiftlint:disable identifier_name
@available(iOS 9.0, *)
public struct LayoutPoint {
    
    let x: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>
    let y: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>
}

@available(iOS 9.0, *)
extension LayoutPoint {
    
    public static func + (lsh: LayoutPoint, rsh: CGSize) -> LayoutPoint {
        return LayoutPoint(x: lsh.x + rsh.width,
                           y: lsh.y + rsh.height)
    }
    
    public static func - (lsh: LayoutPoint, rsh: CGSize) -> LayoutPoint {
        return LayoutPoint(x: lsh.x - rsh.width,
                           y: lsh.y - rsh.height)
    }
}

@available(iOS 9.0, *)
extension LayoutPoint {
    
    @discardableResult
    public static func == (lsh: LayoutPoint, rsh: LayoutPoint) -> [NSLayoutConstraint] {
        return [lsh.x == rsh.x,
                lsh.y == rsh.y]
    }
}

@available(iOS 9.0, *)
extension RLayoutKitWrapper where Base: View {
    
    public var leadingTop: LayoutPoint {
        return LayoutPoint(x: leading,
                           y: top)
    }
    
    public var leadingBottom: LayoutPoint {
        return LayoutPoint(x: leading,
                           y: bottom)
    }
    
    public var trailingTop: LayoutPoint {
        return LayoutPoint(x: trailing,
                           y: top)
    }
    
    public var trailingBottom: LayoutPoint {
        return LayoutPoint(x: trailing,
                           y: bottom)
    }
    
    public var origin: LayoutPoint {
        return leadingTop
    }
    
    public var center: LayoutPoint {
        return LayoutPoint(x: centerX,
                           y: centerY)
    }
    
    public var terminal: LayoutPoint {
        return trailingBottom
    }
}

#if os(iOS)
extension RLayoutKitWrapper where Base: UIScrollView {
    
    @available(iOS 11.0, *)
    public var contentOrigin: LayoutPoint {
        return LayoutPoint(x: contentLeading,
                           y: contentTop)
    }
}
#endif
