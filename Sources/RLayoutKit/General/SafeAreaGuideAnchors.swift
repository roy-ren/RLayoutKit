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
    
    @available(iOS 11.0, *)
    public var safeAreaGuide: UILayoutGuide {
        return base
            .safeAreaLayoutGuide
    }
    
    @available(iOS 11.0, *)
    public var safeAreaLeading: AnchorWrapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .leadingAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var safeAreaTrailing: AnchorWrapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .trailingAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var safeAreaLeft: AnchorWrapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .leftAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var safeAreaRight: AnchorWrapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .rightAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var safeAreaTop: AnchorWrapper<NSLayoutYAxisAnchor> {
        return safeAreaGuide
            .topAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var safeAreaBottom: AnchorWrapper<NSLayoutYAxisAnchor> {
        return safeAreaGuide
            .bottomAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var safeAreaWidth: AnchorWrapper<NSLayoutDimension> {
        return safeAreaGuide
            .widthAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var safeAreaHeight: AnchorWrapper<NSLayoutDimension> {
        return safeAreaGuide
            .heightAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var safeAreaCenterX: AnchorWrapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .centerXAnchor
            .aw
    }
    
    @available(iOS 11.0, *)
    public var safeAreaCenterY: AnchorWrapper<NSLayoutYAxisAnchor> {
        return safeAreaGuide
            .centerYAnchor
            .aw
    }
}
#endif
