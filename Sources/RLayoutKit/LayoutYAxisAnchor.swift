//
//  LayoutYAxisAnchor.swift
//  RLayoutKit
//
//  Created by roy on 2019/3/10.
//

import Foundation

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#endif

extension NSLayoutYAxisAnchor: AnchorCompatible {}

extension AnchorWapper where Base: NSLayoutYAxisAnchor {
    
    /**
     Add constraint to lsh item and make active
     
     - Reference
     ````
     view.topAnchor.constraint(equalTo: toView.topAnchor).isActive = true
     ````
     - Use
     ````
     // extension NSLayoutYAxisAnchor: AnchorCompatible {}
     let topAnchorWapper = view.topAnchor.anchor
     topAnchorWapper == toView.topAnchor.anchor
     
     ````
     */
    public static func == (lsh: AnchorWapper<Base>,
                           rsh: AnchorWapper<Base>) {
        lsh.base
            .constraint(equalTo: rsh.base)
            .isActive = true
    }
    
    public static func >= (lsh: AnchorWapper<Base>,
                           rsh: AnchorWapper<Base>) {
        lsh.base
            .constraint(greaterThanOrEqualTo: rsh.base)
            .isActive = true
    }
    
    public static func <= (lsh: AnchorWapper<Base>,
                           rsh: AnchorWapper<Base>) {
        lsh.base
            .constraint(lessThanOrEqualTo: rsh.base)
            .isActive = true
    }
    
    public static func == (lsh: AnchorWapper<Base>,
                           rsh: LayoutAnchorCombination<Base>) {
        switch rsh {
        case let .constant(anchor, constant):
            lsh.base
                .constraint(equalTo: anchor,
                            constant: constant)
                .isActive = true
        case let .multiplier(anchor, multiplier):
            if #available(iOS 11.0, *) {
                lsh.base
                    .constraint(equalToSystemSpacingBelow: anchor,
                                multiplier: multiplier)
                    .isActive = true
            }
        default:
            return
        }
    }
    
    public static func >= (lsh: AnchorWapper<Base>,
                           rsh: LayoutAnchorCombination<Base>) {
        switch rsh {
        case let .constant(anchor, constant):
            lsh.base
                .constraint(greaterThanOrEqualTo: anchor,
                            constant: constant)
                .isActive = true
        case let .multiplier(anchor, multiplier):
            if #available(iOS 11.0, *) {
                lsh.base
                    .constraint(greaterThanOrEqualToSystemSpacingBelow: anchor,
                                multiplier: multiplier)
                    .isActive = true
            }
        default:
            return
        }
    }
    
    public static func <= (lsh: AnchorWapper<Base>,
                           rsh: LayoutAnchorCombination<Base>) {
        switch rsh {
        case let .constant(anchor, constant):
            lsh.base
                .constraint(lessThanOrEqualTo: anchor,
                            constant: constant)
                .isActive = true
        case let .multiplier(anchor, multiplier):
            if #available(iOS 11.0, *) {
                lsh.base
                    .constraint(lessThanOrEqualToSystemSpacingBelow: anchor,
                                multiplier: multiplier)
                    .isActive = true
            }
        default:
            return
        }
    }
    
    public static func + (lsh: AnchorWapper<Base>,
                          rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        return .constant(anchor: lsh.base,
                         constant: rsh)
    }
    
    public static func - (lsh: AnchorWapper<Base>,
                          rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        return .constant(anchor: lsh.base,
                         constant: rsh)
    }
    
    @available(iOS 10.0, *)
    public static func - (lsh: AnchorWapper<Base>,
                          rsh: AnchorWapper<Base>) -> AnchorWapper<NSLayoutDimension> {
        return lsh.base.anchorWithOffset(to: rsh.base).anchor
    }
    
    @available(iOS 11.0, *)
    public static func * (lsh: AnchorWapper<Base>,
                          rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        return .multiplier(anchor: lsh.base, multiplier: rsh)
    }
}
