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
    
    public var safeAreaLeading: AnchorWrapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .leadingAnchor
            .aw
    }
    
    public var safeAreaTrailing: AnchorWrapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .trailingAnchor
            .aw
    }
    
    public var safeAreaLeft: AnchorWrapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .leftAnchor
            .aw
    }
    
    public var safeAreaRight: AnchorWrapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .rightAnchor
            .aw
    }
    
    public var safeAreaTop: AnchorWrapper<NSLayoutYAxisAnchor> {
        return safeAreaGuide
            .topAnchor
            .aw
    }
    
    public var safeAreaBottom: AnchorWrapper<NSLayoutYAxisAnchor> {
        return safeAreaGuide
            .bottomAnchor
            .aw
    }
    
    public var safeAreaWidth: AnchorWrapper<NSLayoutDimension> {
        return safeAreaGuide
            .widthAnchor
            .aw
    }
    
    public var safeAreaHeight: AnchorWrapper<NSLayoutDimension> {
        return safeAreaGuide
            .heightAnchor
            .aw
    }
    
    public var safeAreaCenterX: AnchorWrapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .centerXAnchor
            .aw
    }
    
    public var safeAreaCenterY: AnchorWrapper<NSLayoutYAxisAnchor> {
        return safeAreaGuide
            .centerYAnchor
            .aw
    }
}
#endif
