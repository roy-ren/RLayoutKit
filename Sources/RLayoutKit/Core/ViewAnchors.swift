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
    public var leading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.leadingAnchor,
                     superAnchor: base.superView?.leadingAnchor)
    }
    
    public var trailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.trailingAnchor,
                     superAnchor: base.superView?.trailingAnchor)
    }
    
    public var left: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.leftAnchor,
                     superAnchor: base.superView?.leftAnchor)
    }
    
    public var right: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.rightAnchor,
                     superAnchor: base.superView?.rightAnchor)
    }
    
    public var top: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(base.topAnchor,
                     superAnchor: base.superView?.topAnchor)
    }
    
    public var bottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(base.bottomAnchor,
                     superAnchor: base.superView?.bottomAnchor)
    }
    
    public var width: AnchorWrapper<NSLayoutDimension, NSLayoutAnchor<NSLayoutDimension>> {
        return .init(base.widthAnchor,
                     superAnchor: base.superView?.widthAnchor)
    }
    
    public var height: AnchorWrapper<NSLayoutDimension, NSLayoutAnchor<NSLayoutDimension>> {
        return .init(base.heightAnchor,
                     superAnchor: base.superView?.heightAnchor)
    }
    
    public var centerX: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.centerXAnchor,
                     superAnchor: base.superView?.centerXAnchor)
    }
    
    public var centerY: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(base.centerYAnchor,
                     superAnchor: base.superView?.centerYAnchor)
    }
    
    public var firstBaseline: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(base.firstBaselineAnchor,
                     superAnchor: base.superView?.firstBaselineAnchor)
    }
    
    public var lastBaseline: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(base.lastBaselineAnchor,
                     superAnchor: base.superView?.lastBaselineAnchor)
    }
}
