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
    
    public var contentLeading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(contentLayoutGuide.leadingAnchor)
    }
    
    public var contentTrailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(contentLayoutGuide.trailingAnchor)
    }
    
    public var contentLeft: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(contentLayoutGuide.leftAnchor)
    }
    
    public var contentRight: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(contentLayoutGuide.rightAnchor)
    }
    
    public var contentTop: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(contentLayoutGuide.topAnchor)
    }
    
    public var contentBottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(contentLayoutGuide.bottomAnchor)
    }
    
    public var contentWidth: AnchorWrapper<NSLayoutDimension, NSLayoutAnchor<NSLayoutDimension>> {
        return .init(contentLayoutGuide.widthAnchor)
    }
    
    public var contentHeight: AnchorWrapper<NSLayoutDimension, NSLayoutAnchor<NSLayoutDimension>> {
        return .init(contentLayoutGuide.heightAnchor)
    }
    
    public var contentCenterX: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(contentLayoutGuide.centerXAnchor)
    }
    
    public var contentCenterY: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(contentLayoutGuide.centerYAnchor)
    }
}

// MARK: - frameLayoutGuide
extension RLayoutKitWrapper where Base: UIScrollView {
    
    public var frameLayoutGuide: UILayoutGuide {
        return base
            .frameLayoutGuide
    }
    
    public var frameLeading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(frameLayoutGuide.leadingAnchor)
    }
    
    public var frameTrailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(frameLayoutGuide.trailingAnchor)
    }
    
    public var frameLeft: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(frameLayoutGuide.leftAnchor)
    }
    
    public var frameRight: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(frameLayoutGuide.rightAnchor)
    }
    
    public var frameTop: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(frameLayoutGuide.topAnchor)
    }
    
    public var frameBottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(frameLayoutGuide.bottomAnchor)
    }
    
    public var frameWidth: AnchorWrapper<NSLayoutDimension, NSLayoutAnchor<NSLayoutDimension>> {
        return .init(frameLayoutGuide.widthAnchor)
    }
    
    public var frameHeight: AnchorWrapper<NSLayoutDimension, NSLayoutAnchor<NSLayoutDimension>> {
        return .init(frameLayoutGuide.heightAnchor)
    }
    
    public var frameCenterX: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(frameLayoutGuide.centerXAnchor)
    }
    
    public var frameCenterY: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(frameLayoutGuide.centerYAnchor)
    }
}

#endif
