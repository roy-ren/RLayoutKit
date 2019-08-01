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
    
    var contentLayoutGuide: UILayoutGuide {
        return base
            .contentLayoutGuide
    }
    
    public var contentLeading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(contentLayoutGuide.leadingAnchor)
    }
    
    public var contentTrailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(contentLayoutGuide.trailingAnchor)
    }
    
    public var contentLeft: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(contentLayoutGuide.leftAnchor)
    }
    
    public var contentRight: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(contentLayoutGuide.rightAnchor)
    }
    
    public var contentTop: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(contentLayoutGuide.topAnchor)
    }
    
    public var contentBottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(contentLayoutGuide.bottomAnchor)
    }
    
    public var contentWidth: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
        return .init(contentLayoutGuide.widthAnchor)
    }
    
    public var contentHeight: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
        return .init(contentLayoutGuide.heightAnchor)
    }
    
    public var contentCenterX: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(contentLayoutGuide.centerXAnchor)
    }
    
    public var contentCenterY: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(contentLayoutGuide.centerYAnchor)
    }
}

// MARK: - frameLayoutGuide
extension RLayoutKitWrapper where Base: UIScrollView {
    
    public var frameLayoutGuide: UILayoutGuide {
        return base
            .frameLayoutGuide
    }
    
    public var frameLeading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(frameLayoutGuide.leadingAnchor)
    }
    
    public var frameTrailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(frameLayoutGuide.trailingAnchor)
    }
    
    public var frameLeft: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(frameLayoutGuide.leftAnchor)
    }
    
    public var frameRight: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(frameLayoutGuide.rightAnchor)
    }
    
    public var frameTop: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(frameLayoutGuide.topAnchor)
    }
    
    public var frameBottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(frameLayoutGuide.bottomAnchor)
    }
    
    public var frameWidth: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
        return .init(frameLayoutGuide.widthAnchor)
    }
    
    public var frameHeight: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
        return .init(frameLayoutGuide.heightAnchor)
    }
    
    public var frameCenterX: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(frameLayoutGuide.centerXAnchor)
    }
    
    public var frameCenterY: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(frameLayoutGuide.centerYAnchor)
    }
}

#endif
