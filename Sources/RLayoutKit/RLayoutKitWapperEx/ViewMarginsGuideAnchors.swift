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
extension RLayoutKitWapper where Base: View {
    var marginsGuide: UILayoutGuide {
        return base
            .layoutMarginsGuide
    }
    
    public var marginsLeading: AnchorWapper<NSLayoutXAxisAnchor> {
        return marginsGuide
            .leadingAnchor
            .anchor
    }
    
    public var marginsTrailing: AnchorWapper<NSLayoutXAxisAnchor> {
        return marginsGuide
            .trailingAnchor
            .anchor
    }
    
    public var marginsLeft: AnchorWapper<NSLayoutXAxisAnchor> {
        return marginsGuide
            .leftAnchor
            .anchor
    }
    
    public var marginsRight: AnchorWapper<NSLayoutXAxisAnchor> {
        return marginsGuide
            .rightAnchor
            .anchor
    }
    
    public var marginsTop: AnchorWapper<NSLayoutYAxisAnchor> {
        return marginsGuide
            .topAnchor
            .anchor
    }
    
    public var marginsBottom: AnchorWapper<NSLayoutYAxisAnchor> {
        return marginsGuide
            .bottomAnchor
            .anchor
    }
    
    public var marginsWidth: AnchorWapper<NSLayoutDimension> {
        return marginsGuide
            .widthAnchor
            .anchor
    }
    
    public var marginsHeight: AnchorWapper<NSLayoutDimension> {
        return marginsGuide
            .heightAnchor
            .anchor
    }
    
    public var marginsCenterX: AnchorWapper<NSLayoutXAxisAnchor> {
        return marginsGuide
            .centerXAnchor
            .anchor
    }
    
    public var marginsCenterY: AnchorWapper<NSLayoutYAxisAnchor> {
        return marginsGuide
            .centerYAnchor
            .anchor
    }
}
#endif
