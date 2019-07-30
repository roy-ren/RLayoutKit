//
//  ViewAnchors.swift
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

extension RLayoutKitWrapper where Base: View {
    
    public var leading: AnchorWrapper<NSLayoutXAxisAnchor> {
        return base
            .leadingAnchor
            .aw(base.superview?.leadingAnchor)
    }
    
    public var trailing: AnchorWrapper<NSLayoutXAxisAnchor> {
        return base
            .trailingAnchor
            .aw(base.superview?.trailingAnchor)
    }
    
    public var left: AnchorWrapper<NSLayoutXAxisAnchor> {
        return base
            .leftAnchor
            .aw(base.superview?.leftAnchor)
    }
    
    public var right: AnchorWrapper<NSLayoutXAxisAnchor> {
        return base
            .rightAnchor
            .aw(base.superview?.rightAnchor)
    }
    
    public var top: AnchorWrapper<NSLayoutYAxisAnchor> {
        return base
            .topAnchor
            .aw(base.superview?.topAnchor)
    }
    
    public var bottom: AnchorWrapper<NSLayoutYAxisAnchor> {
        return base
            .bottomAnchor
            .aw(base.superview?.bottomAnchor)
    }
    
    public var width: AnchorWrapper<NSLayoutDimension> {
        return base
            .widthAnchor
            .aw(base.superview?.widthAnchor)
    }
    
    public var height: AnchorWrapper<NSLayoutDimension> {
        return base
            .heightAnchor
            .aw(base.superview?.widthAnchor)
    }
    
    public var centerX: AnchorWrapper<NSLayoutXAxisAnchor> {
        return base
            .centerXAnchor
            .aw(base.superview?.centerXAnchor)
    }
    
    public var centerY: AnchorWrapper<NSLayoutYAxisAnchor> {
        return base
            .centerYAnchor
            .aw(base.superview?.centerYAnchor)
    }
    
    public var firstBaseline: AnchorWrapper<NSLayoutYAxisAnchor> {
        return base
            .firstBaselineAnchor
            .aw(base.superview?.firstBaselineAnchor)
    }
    
    public var lastBaseline: AnchorWrapper<NSLayoutYAxisAnchor> {
        return base
            .lastBaselineAnchor
            .aw(base.superview?.firstBaselineAnchor)
    }
}
