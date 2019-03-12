//
//  ViewMarginsGuideAnchors.swift
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

#if os(iOS)
extension RLayoutKitWrapper where Base: View {
    
    var marginsGuide: UILayoutGuide {
        return base
            .layoutMarginsGuide
    }
    
    public var marginsLeading: AnchorWrapper<NSLayoutXAxisAnchor> {
        return marginsGuide
            .leadingAnchor
            .aw
    }
    
    public var marginsTrailing: AnchorWrapper<NSLayoutXAxisAnchor> {
        return marginsGuide
            .trailingAnchor
            .aw
    }
    
    public var marginsLeft: AnchorWrapper<NSLayoutXAxisAnchor> {
        return marginsGuide
            .leftAnchor
            .aw
    }
    
    public var marginsRight: AnchorWrapper<NSLayoutXAxisAnchor> {
        return marginsGuide
            .rightAnchor
            .aw
    }
    
    public var marginsTop: AnchorWrapper<NSLayoutYAxisAnchor> {
        return marginsGuide
            .topAnchor
            .aw
    }
    
    public var marginsBottom: AnchorWrapper<NSLayoutYAxisAnchor> {
        return marginsGuide
            .bottomAnchor
            .aw
    }
    
    public var marginsWidth: AnchorWrapper<NSLayoutDimension> {
        return marginsGuide
            .widthAnchor
            .aw
    }
    
    public var marginsHeight: AnchorWrapper<NSLayoutDimension> {
        return marginsGuide
            .heightAnchor
            .aw
    }
    
    public var marginsCenterX: AnchorWrapper<NSLayoutXAxisAnchor> {
        return marginsGuide
            .centerXAnchor
            .aw
    }
    
    public var marginsCenterY: AnchorWrapper<NSLayoutYAxisAnchor> {
        return marginsGuide
            .centerYAnchor
            .aw
    }
}
#endif
