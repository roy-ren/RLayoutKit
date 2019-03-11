//
//  ViewSafeAreaAnchors.swift
//  RLayoutKit
//
//  Created by roy on 2019/3/11.
//

import Foundation

#if os(iOS)
import UIKit

extension RLayoutKitWapper where Base: View {
    
    @available(iOS 11.0, *)
    public var safeAreaGuide: UILayoutGuide {
        return base
            .safeAreaLayoutGuide
    }
    
    @available(iOS 11.0, *)
    public var safeAreaLeading: AnchorWapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .leadingAnchor
            .anchor
    }
    
    @available(iOS 11.0, *)
    public var safeAreaTrailing: AnchorWapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .trailingAnchor
            .anchor
    }
    
    @available(iOS 11.0, *)
    public var safeAreaLeft: AnchorWapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .leftAnchor
            .anchor
    }
    
    @available(iOS 11.0, *)
    public var safeAreaRight: AnchorWapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .rightAnchor
            .anchor
    }
    
    @available(iOS 11.0, *)
    public var safeAreaTop: AnchorWapper<NSLayoutYAxisAnchor> {
        return safeAreaGuide
            .topAnchor
            .anchor
    }
    
    @available(iOS 11.0, *)
    public var safeAreaBottom: AnchorWapper<NSLayoutYAxisAnchor> {
        return safeAreaGuide
            .bottomAnchor
            .anchor
    }
    
    @available(iOS 11.0, *)
    public var safeAreaWidth: AnchorWapper<NSLayoutDimension> {
        return safeAreaGuide
            .widthAnchor
            .anchor
    }
    
    @available(iOS 11.0, *)
    public var safeAreaHeight: AnchorWapper<NSLayoutDimension> {
        return safeAreaGuide
            .heightAnchor
            .anchor
    }
    
    @available(iOS 11.0, *)
    public var safeAreaCenterX: AnchorWapper<NSLayoutXAxisAnchor> {
        return safeAreaGuide
            .centerXAnchor
            .anchor
    }
    
    @available(iOS 11.0, *)
    public var safeAreaCenterY: AnchorWapper<NSLayoutYAxisAnchor> {
        return safeAreaGuide
            .centerYAnchor
            .anchor
    }
}
#endif
