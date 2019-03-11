//
//  LayoutDimension.swift
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

extension NSLayoutDimension: AnchorCompatible {}

extension AnchorWapper where Base: NSLayoutDimension {
    public static func == (lsh: AnchorWapper<Base>,
                           rsh: CGFloat) {
        lsh.base
            .constraint(equalToConstant: rsh)
            .isActive = true
    }
    
    public static func >= (lsh: AnchorWapper<Base>,
                           rsh: CGFloat) {
        lsh.base
            .constraint(greaterThanOrEqualToConstant: rsh)
            .isActive = true
    }
    
    public static func <= (lsh: AnchorWapper<Base>,
                           rsh: CGFloat) {
        lsh.base
            .constraint(lessThanOrEqualToConstant: rsh)
            .isActive = true
    }
    
    public static func * (lsh: AnchorWapper<Base>,
                          rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        return .multiplier(anchor: lsh.base,
                           multiplier: rsh)
    }
    
    public static func - (lsh: AnchorWapper<Base>,
                          rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        return .constant(anchor: lsh.base,
                         constant: rsh)
    }
    
    public static func == (lsh: AnchorWapper<Base>,
                           rsh: LayoutAnchorCombination<Base>) {
        switch rsh {
        case let .multiplier(dimension, multiplier):
            lsh.base
                .constraint(equalTo: dimension,
                            multiplier: multiplier)
                .isActive = true
        case let .multiplierAndConstant(dimension, multiplier, constant):
            lsh.base
                .constraint(equalTo: dimension,
                            multiplier: multiplier,
                            constant: constant)
                .isActive = true
        default:
            return
        }
    }
    
    public static func >= (lsh: AnchorWapper<Base>,
                           rsh: AnchorWapper.LayoutAnchorCombination<Base>) {
        switch rsh {
        case let .multiplier(dimension, multiplier):
            lsh.base
                .constraint(greaterThanOrEqualTo: dimension,
                            multiplier: multiplier)
                .isActive = true
        case let .multiplierAndConstant(dimension, multiplier, constant):
            lsh.base
                .constraint(greaterThanOrEqualTo: dimension,
                            multiplier: multiplier,
                            constant: constant)
                .isActive = true
        default:
            return
        }
    }
    
    public static func <= (lsh: AnchorWapper<Base>,
                           rsh: AnchorWapper.LayoutAnchorCombination<Base>) {
        switch rsh {
        case let .multiplier(dimension, multiplier):
            lsh.base
                .constraint(lessThanOrEqualTo: dimension,
                            multiplier: multiplier)
                .isActive = true
        case let .multiplierAndConstant(dimension, multiplier, constant):
            lsh.base
                .constraint(lessThanOrEqualTo: dimension,
                            multiplier: multiplier,
                            constant: constant)
                .isActive = true
        default:
            return
        }
    }
}
