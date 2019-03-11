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

extension RLayoutKitWapper where Base: View {
    
    public var leading: AnchorWapper<NSLayoutXAxisAnchor> {
        return base
            .leadingAnchor
            .anchor
    }
    
    public var trailing: AnchorWapper<NSLayoutXAxisAnchor> {
        return base
            .trailingAnchor
            .anchor
    }
    
    public var left: AnchorWapper<NSLayoutXAxisAnchor> {
        return base
            .leftAnchor
            .anchor
    }
    
    public var right: AnchorWapper<NSLayoutXAxisAnchor> {
        return base
            .rightAnchor
            .anchor
    }
    
    public var top: AnchorWapper<NSLayoutYAxisAnchor> {
        return base
            .topAnchor
            .anchor
    }
    
    public var bottom: AnchorWapper<NSLayoutYAxisAnchor> {
        return base
            .bottomAnchor
            .anchor
    }
    
    public var width: AnchorWapper<NSLayoutDimension> {
        return base
            .widthAnchor
            .anchor
    }
    
    public var height: AnchorWapper<NSLayoutDimension> {
        return base
            .heightAnchor
            .anchor
    }
    
    public var centerX: AnchorWapper<NSLayoutXAxisAnchor> {
        return base
            .centerXAnchor
            .anchor
    }
    
    public var centerY: AnchorWapper<NSLayoutYAxisAnchor> {
        return base
            .centerYAnchor
            .anchor
    }
    
    public var firstBaseline: AnchorWapper<NSLayoutYAxisAnchor> {
        return base
            .firstBaselineAnchor
            .anchor
    }
    
    public var lastBaseline: AnchorWapper<NSLayoutYAxisAnchor> {
        return base
            .lastBaselineAnchor
            .anchor
    }
}
