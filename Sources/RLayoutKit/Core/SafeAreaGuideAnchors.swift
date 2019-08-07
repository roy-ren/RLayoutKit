//
//  ViewSafeAreaAnchors.swift
//  RLayoutKit
//
//  Created by roy on 2019/3/11.
//

import Foundation

#if os(iOS)
import UIKit

@available(iOS 11.0, *)
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
    
    public var safeAreaLeading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(safeAreaGuide.leadingAnchor,
                     superAnchor: superSafeAreaGuide?.leadingAnchor)
    }
    
    public var safeAreaTrailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(safeAreaGuide.trailingAnchor,
                     superAnchor: superSafeAreaGuide?.trailingAnchor)
    }
    
    public var safeAreaLeft: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(safeAreaGuide.leftAnchor,
                     superAnchor: superSafeAreaGuide?.leftAnchor)
    }
    
    public var safeAreaRight: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(safeAreaGuide.rightAnchor,
                     superAnchor: superSafeAreaGuide?.rightAnchor)
    }
    
    public var safeAreaTop: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(safeAreaGuide.topAnchor,
                     superAnchor: superSafeAreaGuide?.topAnchor)
    }
    
    public var safeAreaBottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(safeAreaGuide.bottomAnchor,
                     superAnchor: superSafeAreaGuide?.bottomAnchor)
    }
    
    public var safeAreaWidth: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
        return .init(safeAreaGuide.widthAnchor,
                     superAnchor: superSafeAreaGuide?.widthAnchor)
    }
    
    public var safeAreaHeight: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
        return .init(safeAreaGuide.heightAnchor,
                     superAnchor: superSafeAreaGuide?.heightAnchor)
    }
    
    public var safeAreaCenterX: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return .init(safeAreaGuide.centerXAnchor,
                     superAnchor: superSafeAreaGuide?.centerXAnchor)
    }
    
    public var safeAreaCenterY: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return .init(safeAreaGuide.centerYAnchor,
                     superAnchor: superSafeAreaGuide?.centerYAnchor)
    }
}
#endif
