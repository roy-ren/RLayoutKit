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
@available(iOS 11.0, *)
extension RLayoutKitWrapper where Base: UIScrollView {
    
    var contentLayoutGuide: UILayoutGuide {
        return base
            .contentLayoutGuide
    }
    
    public var contentLeading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(anchor: contentLayoutGuide.leadingAnchor)
    }
    
    public var contentTrailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(anchor: contentLayoutGuide.trailingAnchor)
    }
    
    public var contentLeft: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(anchor: contentLayoutGuide.leftAnchor)
    }
    
    public var contentRight: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(anchor: contentLayoutGuide.rightAnchor)
    }
    
    public var contentTop: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(anchor: contentLayoutGuide.topAnchor)
    }
    
    public var contentBottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(anchor: contentLayoutGuide.bottomAnchor)
    }
    
    public var contentWidth: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
        return .init(anchor: contentLayoutGuide.widthAnchor)
    }
    
    public var contentHeight: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
        return .init(anchor: contentLayoutGuide.heightAnchor)
    }
    
    public var contentCenterX: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(anchor: contentLayoutGuide.centerXAnchor)
    }
    
    public var contentCenterY: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(anchor: contentLayoutGuide.centerYAnchor)
    }
}

// MARK: - frameLayoutGuide
@available(iOS 11.0, *)
extension RLayoutKitWrapper where Base: UIScrollView {
    
    public var frameLayoutGuide: UILayoutGuide {
        return base
            .frameLayoutGuide
    }
    
    public var frameLeading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(anchor: frameLayoutGuide.leadingAnchor)
    }
    
    public var frameTrailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(anchor: frameLayoutGuide.trailingAnchor)
    }
    
    public var frameLeft: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(anchor: frameLayoutGuide.leftAnchor)
    }
    
    public var frameRight: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(anchor: frameLayoutGuide.rightAnchor)
    }
    
    public var frameTop: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(anchor: frameLayoutGuide.topAnchor)
    }
    
    public var frameBottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(anchor: frameLayoutGuide.bottomAnchor)
    }
    
    public var frameWidth: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
        return .init(anchor: frameLayoutGuide.widthAnchor)
    }
    
    public var frameHeight: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
        return .init(anchor: frameLayoutGuide.heightAnchor)
    }
    
    public var frameCenterX: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(anchor: frameLayoutGuide.centerXAnchor)
    }
    
    public var frameCenterY: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(anchor: frameLayoutGuide.centerYAnchor)
    }
}

#endif
