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
public struct LayoutPoint {
    
    let x: AnchorWrapper<NSLayoutXAxisAnchor>
    let y: AnchorWrapper<NSLayoutYAxisAnchor>
    
    @discardableResult
    public static func == (lsh: LayoutPoint, rsh: LayoutPoint) -> [NSLayoutConstraint] {
        return [lsh.x == rsh.x,
                lsh.y == rsh.y]
    }
    
    @discardableResult
    public static func == (lsh: LayoutPoint, rsh: LayoutInsetsPoint) -> [NSLayoutConstraint] {
        return [lsh.x == rsh.x,
                lsh.y == rsh.y]
    }
}

extension LayoutPoint {
    
    public static func + (lsh: LayoutPoint, rsh: CGSize) -> LayoutInsetsPoint {
        return LayoutInsetsPoint(x: lsh.x + rsh.width,
                                 y: lsh.y + rsh.height)
    }
    
    public static func - (lsh: LayoutPoint, rsh: CGSize) -> LayoutInsetsPoint {
        return LayoutInsetsPoint(x: lsh.x - rsh.width,
                                 y: lsh.y - rsh.height)
    }
}

public struct LayoutInsetsPoint {
    
    let x: BaseLayoutConstrainted<NSLayoutXAxisAnchor>
    let y: BaseLayoutConstrainted<NSLayoutYAxisAnchor>
    
    public static func + (lsh: LayoutInsetsPoint, rsh: CGSize) -> LayoutInsetsPoint {
        return LayoutInsetsPoint(x: lsh.x + rsh.width,
                                 y: lsh.y + rsh.height)
    }
    
    public static func - (lsh: LayoutInsetsPoint, rsh: CGSize) -> LayoutInsetsPoint {
        return LayoutInsetsPoint(x: lsh.x - rsh.width,
                                 y: lsh.y - rsh.height)
    }
}

extension RLayoutKitWrapper where Base: View {
    
    public var leadingTop: LayoutPoint {
        return LayoutPoint(x: leading,
                           y: top)
    }
    
    public var leadingBottom: LayoutPoint {
        return LayoutPoint(x: leading,
                           y: bottom)
    }
    
    public var trialingTop: LayoutPoint {
        return LayoutPoint(x: trailing,
                           y: top)
    }
    
    public var trialingBottom: LayoutPoint {
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
        return trialingBottom
    }
}
