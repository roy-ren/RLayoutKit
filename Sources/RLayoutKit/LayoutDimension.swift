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
    @discardableResult
    public static func == (lsh: AnchorWapper<Base>,
                           rsh: CGFloat) -> NSLayoutConstraint {
        return lsh.base
            .constraint(equalToConstant: rsh)
            .active
    }
    
    @discardableResult
    public static func >= (lsh: AnchorWapper<Base>,
                           rsh: CGFloat) -> NSLayoutConstraint {
        return lsh.base
            .constraint(greaterThanOrEqualToConstant: rsh)
            .active
    }
    
    @discardableResult
    public static func <= (lsh: AnchorWapper<Base>,
                           rsh: CGFloat) -> NSLayoutConstraint {
        return lsh.base
            .constraint(lessThanOrEqualToConstant: rsh)
            .active
    }
    
    @discardableResult
    public static func * (lsh: AnchorWapper<Base>,
                          rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        return .multiplier(anchor: lsh.base,
                           multiplier: rsh)
    }
    
    @discardableResult
    public static func + (lsh: AnchorWapper<Base>,
                          rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        return .constant(anchor: lsh.base,
                         constant: rsh)
    }
    
    @discardableResult
    public static func - (lsh: AnchorWapper<Base>,
                          rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        return .constant(anchor: lsh.base,
                         constant: -rsh)
    }
    
    @discardableResult
    public static func == (lsh: AnchorWapper<Base>,
                           rsh: LayoutAnchorCombination<Base>) -> NSLayoutConstraint {
        switch rsh {
        case let .constant(dimension, constant):
            return lsh.base
                .constraint(equalTo: dimension,
                            multiplier: 0,
                            constant: constant)
        case let .multiplier(dimension, multiplier):
            return lsh.base
                .constraint(equalTo: dimension,
                            multiplier: multiplier)
                .active
        case let .multiplierAndConstant(dimension, multiplier, constant):
            return lsh.base
                .constraint(equalTo: dimension,
                            multiplier: multiplier,
                            constant: constant)
                .active
        }
    }
    
    @discardableResult
    public static func >= (lsh: AnchorWapper<Base>,
                           rsh: LayoutAnchorCombination<Base>) -> NSLayoutConstraint {
        switch rsh {
        case let .constant(dimension, constant):
            return lsh.base
                .constraint(greaterThanOrEqualTo: dimension,
                            multiplier: 0,
                            constant: constant)
        case let .multiplier(dimension, multiplier):
            return lsh.base
                .constraint(greaterThanOrEqualTo: dimension,
                            multiplier: multiplier)
                .active
        case let .multiplierAndConstant(dimension, multiplier, constant):
            return lsh.base
                .constraint(greaterThanOrEqualTo: dimension,
                            multiplier: multiplier,
                            constant: constant)
                .active
        }
    }
    
    @discardableResult
    public static func <= (lsh: AnchorWapper<Base>,
                           rsh: LayoutAnchorCombination<Base>) -> NSLayoutConstraint {
        switch rsh {
        case let .constant(dimension, constant):
            return lsh.base
                .constraint(lessThanOrEqualTo: dimension,
                            multiplier: 0,
                            constant: constant)
        case let .multiplier(dimension, multiplier):
            return lsh.base
                .constraint(lessThanOrEqualTo: dimension,
                            multiplier: multiplier)
                .active
        case let .multiplierAndConstant(dimension, multiplier, constant):
            return lsh.base
                .constraint(lessThanOrEqualTo: dimension,
                            multiplier: multiplier,
                            constant: constant)
                .active
        }
    }
}
