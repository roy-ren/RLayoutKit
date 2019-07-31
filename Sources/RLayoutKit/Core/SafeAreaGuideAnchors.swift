//
//  ViewSafeAreaAnchors.swift
//  RLayoutKit
//
//  Created by roy on 2019/3/11.
//

import Foundation

#if os(iOS)
import UIKit

extension RLayoutKitWrapper where Base: View {
    
    public var safeAreaGuide: UILayoutGuide {
        return base
            .safeAreaLayoutGuide
    }
    
    public var superSafeAreaGuide: UILayoutGuide? {
        return base
            .superView?
            .safeAreaLayoutGuide
    }
    
    public var safeAreaLeading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.leadingAnchor,
                     superAnchor: superSafeAreaGuide?.leadingAnchor)
    }
    
    public var safeAreaTrailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.trailingAnchor,
                     superAnchor: superSafeAreaGuide?.trailingAnchor)
    }
    
    public var safeAreaLeft: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.leftAnchor,
                     superAnchor: superSafeAreaGuide?.leftAnchor)
    }
    
    public var safeAreaRight: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.rightAnchor,
                     superAnchor: superSafeAreaGuide?.rightAnchor)
    }
    
    public var safeAreaTop: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(base.topAnchor,
                     superAnchor: superSafeAreaGuide?.topAnchor)
    }
    
    public var safeAreaBottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(base.bottomAnchor,
                     superAnchor: superSafeAreaGuide?.bottomAnchor)
    }
    
    public var safeAreaWidth: AnchorWrapper<NSLayoutDimension, NSLayoutAnchor<NSLayoutDimension>> {
        return .init(base.widthAnchor,
                     superAnchor: superSafeAreaGuide?.widthAnchor)
    }
    
    public var safeAreaHeight: AnchorWrapper<NSLayoutDimension, NSLayoutAnchor<NSLayoutDimension>> {
        return .init(base.heightAnchor,
                     superAnchor: superSafeAreaGuide?.heightAnchor)
    }
    
    public var safeAreaCenterX: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutAnchor<NSLayoutXAxisAnchor>> {
        return .init(base.centerXAnchor,
                     superAnchor: superSafeAreaGuide?.centerXAnchor)
    }
    
    public var safeAreaCenterY: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutAnchor<NSLayoutYAxisAnchor>> {
        return .init(base.centerYAnchor,
                     superAnchor: superSafeAreaGuide?.centerYAnchor)
    }
}
#endif
