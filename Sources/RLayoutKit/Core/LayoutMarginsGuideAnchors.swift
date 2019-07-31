//
//  RLayoutKitWrapper.swift
//  RLayoutKit
//
//  Created by roy on 2019/3/11.
//

import Foundation

#if os(iOS)
import UIKit

extension RLayoutKitWrapper where Base: View {
    
    var marginsGuide: UILayoutGuide {
        return base
            .layoutMarginsGuide
    }
    
    var superMarginsGuide: UILayoutGuide? {
        return base
            .superView?
            .layoutMarginsGuide
    }
    
    public var marginsLeading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.leadingAnchor,
                     superAnchor: superMarginsGuide?.leadingAnchor)
    }
    
    public var marginsTrailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.trailingAnchor,
                     superAnchor: superMarginsGuide?.trailingAnchor)
    }
    
    public var marginsLeft: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.leftAnchor,
                     superAnchor: superMarginsGuide?.leftAnchor)
    }
    
    public var marginsRight: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.rightAnchor,
                     superAnchor: superMarginsGuide?.rightAnchor)
    }
    
    public var marginsTop: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(base.topAnchor,
                     superAnchor: superMarginsGuide?.topAnchor)
    }
    
    public var marginsBottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(base.bottomAnchor,
                     superAnchor: superMarginsGuide?.bottomAnchor)
    }
    
    public var marginsWidth: AnchorWrapper<NSLayoutDimension, NSLayoutAnchor<NSLayoutDimension>> {
        return .init(base.widthAnchor,
                     superAnchor: superMarginsGuide?.widthAnchor)
    }
    
    public var marginsHeight: AnchorWrapper<NSLayoutDimension, NSLayoutAnchor<NSLayoutDimension>> {
        return .init(base.heightAnchor,
                     superAnchor: superMarginsGuide?.heightAnchor)
    }
    
    public var marginsCenterX: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.centerXAnchor,
                     superAnchor: superMarginsGuide?.centerXAnchor)
    }
    
    public var marginsCenterY: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(base.centerYAnchor,
                     superAnchor: superMarginsGuide?.centerYAnchor)
    }
}
#endif
