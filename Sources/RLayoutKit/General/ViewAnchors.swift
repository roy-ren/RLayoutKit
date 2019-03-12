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
            .aw
    }
    
    public var trailing: AnchorWrapper<NSLayoutXAxisAnchor> {
        return base
            .trailingAnchor
            .aw
    }
    
    public var left: AnchorWrapper<NSLayoutXAxisAnchor> {
        return base
            .leftAnchor
            .aw
    }
    
    public var right: AnchorWrapper<NSLayoutXAxisAnchor> {
        return base
            .rightAnchor
            .aw
    }
    
    public var top: AnchorWrapper<NSLayoutYAxisAnchor> {
        return base
            .topAnchor
            .aw
    }
    
    public var bottom: AnchorWrapper<NSLayoutYAxisAnchor> {
        return base
            .bottomAnchor
            .aw
    }
    
    public var width: AnchorWrapper<NSLayoutDimension> {
        return base
            .widthAnchor
            .aw
    }
    
    public var height: AnchorWrapper<NSLayoutDimension> {
        return base
            .heightAnchor
            .aw
    }
    
    public var centerX: AnchorWrapper<NSLayoutXAxisAnchor> {
        return base
            .centerXAnchor
            .aw
    }
    
    public var centerY: AnchorWrapper<NSLayoutYAxisAnchor> {
        return base
            .centerYAnchor
            .aw
    }
    
    public var firstBaseline: AnchorWrapper<NSLayoutYAxisAnchor> {
        return base
            .firstBaselineAnchor
            .aw
    }
    
    public var lastBaseline: AnchorWrapper<NSLayoutYAxisAnchor> {
        return base
            .lastBaselineAnchor
            .aw
    }
}
