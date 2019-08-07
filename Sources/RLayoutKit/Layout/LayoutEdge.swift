//
//  LayoutEdge.swift
//  RLayoutKit
//
//  Created by roy on 2019/3/12.
//

import Foundation

#if os(macOS)
import AppKit
public typealias EdgeInsets = NSEdgeInsets
#elseif os(iOS)
import UIKit
public typealias EdgeInsets = UIEdgeInsets
#endif

@available(iOS 9.0, *)
public struct LayoutEdge {
    
    let leading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>
    let trailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>
    let top: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>
    let bottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>
    
    @discardableResult
    public static func == (lsh: LayoutEdge, rsh: LayoutEdge) -> [NSLayoutConstraint] {
        return [lsh.leading == rsh.leading,
                lsh.trailing == rsh.trailing,
                lsh.top == rsh.top,
                lsh.bottom == rsh.bottom]
    }
    
    @discardableResult
    public static func == (lsh: LayoutEdge, rsh: LayoutInsetsEdge) -> [NSLayoutConstraint] {
        
        return [lsh.leading == rsh.leading,
                lsh.trailing == rsh.trailing,
                lsh.top == rsh.top,
                lsh.bottom == rsh.bottom]
    }
}

@available(iOS 9.0, *)
extension LayoutEdge {

    public static func + (lsh: LayoutEdge, rsh: EdgeInsets) -> LayoutInsetsEdge {
        return LayoutInsetsEdge(leading: lsh.leading + rsh.left,
                                trailing: lsh.trailing - rsh.right,
                                top: lsh.top + rsh.top,
                                bottom: lsh.bottom - rsh.bottom)
    }

    public static func - (lsh: LayoutEdge, rsh: EdgeInsets) -> LayoutInsetsEdge {
        return LayoutInsetsEdge(leading: lsh.leading - rsh.left,
                                trailing: lsh.trailing + rsh.right,
                                top: lsh.top - rsh.top,
                                bottom: lsh.bottom + rsh.bottom)
    }
}

@available(iOS 9.0, *)
public struct LayoutInsetsEdge {

    let leading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>
    let trailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor>
    let top: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>
    let bottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor>

    public static func + (lsh: LayoutInsetsEdge, rsh: EdgeInsets) -> LayoutInsetsEdge {
        return LayoutInsetsEdge(leading: lsh.leading + rsh.left,
                                trailing: lsh.trailing - rsh.right,
                                top: lsh.top + rsh.top,
                                bottom: lsh.bottom - rsh.bottom)
    }

    public static func - (lsh: LayoutInsetsEdge, rsh: EdgeInsets) -> LayoutInsetsEdge {
        return LayoutInsetsEdge(leading: lsh.leading - rsh.left,
                                trailing: lsh.trailing + rsh.right,
                                top: lsh.top - rsh.top,
                                bottom: lsh.bottom + rsh.bottom)
    }
}

@available(iOS 9.0, *)
extension RLayoutKitWrapper where Base: View {

    public var edges: LayoutEdge {
        return LayoutEdge(leading: leading,
                          trailing: trailing,
                          top: top,
                          bottom: bottom)
    }

    #if os(iOS)
    public var marginsEdges: LayoutEdge {
        return LayoutEdge(leading: marginsLeading,
                          trailing: marginsTrailing,
                          top: marginsTop,
                          bottom: marginsBottom)
    }

    @available(iOS 11.0, *)
    public var safeAreaEdges: LayoutEdge {
        return LayoutEdge(leading: safeAreaLeading,
                          trailing: safeAreaTrailing,
                          top: safeAreaTop,
                          bottom: safeAreaBottom)
    }
    #endif
}

#if os(iOS)

@available(iOS 11.0, *)
extension RLayoutKitWrapper where Base: UIScrollView {

    public var contentLayoutEdges: LayoutEdge {
        return LayoutEdge(leading: contentLeading,
                          trailing: contentTrailing,
                          top: contentTop,
                          bottom: contentBottom)
    }

    public var frameLayoutEdges: LayoutEdge {
        return LayoutEdge(leading: frameLeading,
                          trailing: frameTrailing,
                          top: frameTop,
                          bottom: frameBottom)
    }
}
#endif
