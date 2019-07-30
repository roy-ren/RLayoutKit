//
//  ScrollViewLayoutGuideAnchors.swift
//  RLayoutKit
//
//  Created by roy on 2019/4/16.
//

import Foundation

#if os(iOS)
import UIKit

// MARK: - contentLayoutGuide

extension RLayoutKitWrapper where Base: UIScrollView {
    
    public var contentLayoutGuide: UILayoutGuide {
        return base
            .contentLayoutGuide
    }
    
    public var contentLeading: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .leadingAnchor
            .aw
    }
    
    public var contentTrailing: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .trailingAnchor
            .aw
    }
    
    public var contentLeft: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .leftAnchor
            .aw
    }
    
    public var contentRight: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .rightAnchor
            .aw
    }
    
    public var contentTop: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .topAnchor
            .aw
    }
    
    public var contentBottom: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .bottomAnchor
            .aw
    }
    
    public var contentWidth: AnchorWrapper<NSLayoutDimension> {
        return contentLayoutGuide
            .widthAnchor
            .aw
    }
    
    public var contentHeight: AnchorWrapper<NSLayoutDimension> {
        return contentLayoutGuide
            .heightAnchor
            .aw
    }
    
    public var contentCenterX: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .centerXAnchor
            .aw
    }
    
    public var contentCenterY: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .centerYAnchor
            .aw
    }
}

// MARK: - frameLayoutGuide
extension RLayoutKitWrapper where Base: UIScrollView {
    
    public var frameLayoutGuide: UILayoutGuide {
        return base
            .frameLayoutGuide
    }
    
    public var frameLeading: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .leadingAnchor
            .aw
    }
    
    public var frameTrailing: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .trailingAnchor
            .aw
    }
    
    public var frameLeft: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .leftAnchor
            .aw
    }
    
    public var frameRight: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .rightAnchor
            .aw
    }
    
    public var frameTop: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .topAnchor
            .aw
    }
    
    public var frameBottom: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .bottomAnchor
            .aw
    }
    
    public var frameWidth: AnchorWrapper<NSLayoutDimension> {
        return contentLayoutGuide
            .widthAnchor
            .aw
    }
    
    public var frameHeight: AnchorWrapper<NSLayoutDimension> {
        return contentLayoutGuide
            .heightAnchor
            .aw
    }
    
    public var frameCenterX: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .centerXAnchor
            .aw
    }
    
    public var frameCenterY: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .centerYAnchor
            .aw
    }
}

#endif
