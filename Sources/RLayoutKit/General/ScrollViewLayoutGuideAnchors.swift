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
    @available(iOS 11.0, *)
    public var contentLayoutGuide: UILayoutGuide {
        return base
            .contentLayoutGuide
    }
    
    @available(iOS 11.0, *)
    public var contentLeading: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .leadingAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var contentTrailing: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .trailingAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var contentLeft: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .leftAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var contentRight: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .rightAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var contentTop: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .topAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var contentBottom: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .bottomAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var contentWidth: AnchorWrapper<NSLayoutDimension> {
        return contentLayoutGuide
            .widthAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var contentHeight: AnchorWrapper<NSLayoutDimension> {
        return contentLayoutGuide
            .heightAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var contentCenterX: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .centerXAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var contentCenterY: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .centerYAnchor
            .aw
    }
}

// MARK: - frameLayoutGuide
extension RLayoutKitWrapper where Base: UIScrollView {
    @available(iOS 11.0, *)
    public var frameLayoutGuide: UILayoutGuide {
        return base
            .frameLayoutGuide
    }
    
    @available(iOS 11.0, *)
    public var frameLeading: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .leadingAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var frameTrailing: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .trailingAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var frameLeft: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .leftAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var frameRight: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .rightAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var frameTop: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .topAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var frameBottom: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .bottomAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var frameWidth: AnchorWrapper<NSLayoutDimension> {
        return contentLayoutGuide
            .widthAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var frameHeight: AnchorWrapper<NSLayoutDimension> {
        return contentLayoutGuide
            .heightAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var frameCenterX: AnchorWrapper<NSLayoutXAxisAnchor> {
        return contentLayoutGuide
            .centerXAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var frameCenterY: AnchorWrapper<NSLayoutYAxisAnchor> {
        return contentLayoutGuide
            .centerYAnchor
            .aw
    }
}

#endif
