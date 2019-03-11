//
//  LayoutAnchorCombination.swift
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

// MARK: AnchorCombination
/**
 Anchor information, an anchor with constant or mutiplier
 
 1. constant: just with constant
 2. multiplier: just with mutiplier
 3. multiplierAndConstant: with a mutilpier and a constant
 ````
 public static func + (lsh: AnchorWapper<Base>, rsh: CGFloat) -> AnchorWapper.AnchorCombination<Base> {
 return .constant(anchor: lsh.base, constant: rsh)
 }
 ````
 */
public enum LayoutAnchorCombination<Base> {
    case constant(anchor: Base, constant: CGFloat)
    case multiplier(anchor: Base, multiplier: CGFloat)
    case multiplierAndConstant(anchor: Base, multiplier: CGFloat, constant: CGFloat)
    
    @discardableResult
    public static func + (lsh: LayoutAnchorCombination<Base>,
                          rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        switch lsh {
        case let .constant(anchor,
                           constant):
            return .constant(anchor: anchor,
                             constant: constant + rsh)
        case let .multiplier(anchor,
                             multiplier):
            return .multiplierAndConstant(anchor: anchor,
                                          multiplier: multiplier,
                                          constant: rsh)
        case let .multiplierAndConstant(anchor,
                                        multiplier,
                                        constant):
            return .multiplierAndConstant(anchor: anchor,
                                          multiplier: multiplier,
                                          constant: constant + rsh)
        }
    }
    
    @discardableResult
    public static func - (lsh: LayoutAnchorCombination<Base>, rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        switch lsh {
        case let .constant(anchor,
                           constant):
            return .constant(anchor: anchor,
                             constant: constant - rsh)
        case let .multiplier(anchor,
                             multiplier):
            return .multiplierAndConstant(anchor: anchor,
                                          multiplier: multiplier,
                                          constant: -rsh)
        case let .multiplierAndConstant(anchor,
                                        multiplier,
                                        constant):
            return .multiplierAndConstant(anchor: anchor,
                                          multiplier: multiplier,
                                          constant: constant - rsh)
        }
    }
    
    @discardableResult
    public static func * (lsh: LayoutAnchorCombination<Base>, rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        switch lsh {
        case .constant:
            return lsh
        case let .multiplier(anchor,
                             multiplier):
            return .multiplier(anchor: anchor,
                               multiplier: multiplier * rsh)
        case let .multiplierAndConstant(anchor,
                                        multiplier,
                                        constant):
            return .multiplierAndConstant(anchor: anchor,
                                          multiplier: multiplier * rsh,
                                          constant: constant + rsh)
        }
    }
}
