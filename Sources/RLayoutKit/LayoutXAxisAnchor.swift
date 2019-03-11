//
//  LayoutXAxisAnchor.swift
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

extension NSLayoutXAxisAnchor: AnchorCompatible {}

extension AnchorWapper where Base: NSLayoutXAxisAnchor {
    /**
     An example of using the note field
     
     - Note:
     This method returns an estimate.
     Use `reallyAccurateReading` to get the best results.
     */
    func test() {
        
    }
    /**
     An example of using the note field
     
     - Note:
     This method returns an estimate.
     Use `reallyAccurateReading` to get the best results.
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
                    .constraint(equalToSystemSpacingAfter: anchor,
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
                    .constraint(greaterThanOrEqualToSystemSpacingAfter: anchor,
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
                    .constraint(lessThanOrEqualToSystemSpacingAfter: anchor,
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
