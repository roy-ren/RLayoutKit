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
    @discardableResult
    public static func == (lsh: AnchorWapper<Base>,
                           rsh: AnchorWapper<Base>) -> NSLayoutConstraint {
        return lsh.base
            .constraint(equalTo: rsh.base)
            .active
    }
    
    @discardableResult
    public static func >= (lsh: AnchorWapper<Base>,
                           rsh: AnchorWapper<Base>) -> NSLayoutConstraint {
        return lsh.base
            .constraint(greaterThanOrEqualTo: rsh.base)
            .active
    }
    
    @discardableResult
    public static func <= (lsh: AnchorWapper<Base>,
                           rsh: AnchorWapper<Base>) -> NSLayoutConstraint {
        return lsh.base
            .constraint(lessThanOrEqualTo: rsh.base)
            .active
    }
    
    @discardableResult
    public static func == (lsh: AnchorWapper<Base>,
                           rsh: LayoutAnchorCombination<Base>) -> NSLayoutConstraint? {
        switch rsh {
        case let .constant(anchor, constant):
            return lsh.base
                .constraint(equalTo: anchor,
                            constant: constant)
                .active
        case let .multiplier(anchor, multiplier):
            #if os(iOS)
            if #available(iOS 11.0, *) {
                return lsh.base
                    .constraint(equalToSystemSpacingAfter: anchor,
                                multiplier: multiplier)
                    .active
            }
            #endif
        default:
            break
        }
        
        return nil
    }
    
    @discardableResult
    public static func >= (lsh: AnchorWapper<Base>,
                           rsh: LayoutAnchorCombination<Base>) -> NSLayoutConstraint? {
        switch rsh {
        case let .constant(anchor, constant):
            return lsh.base
                .constraint(greaterThanOrEqualTo: anchor,
                            constant: constant)
                .active
        case let .multiplier(anchor, multiplier):
            #if os(iOS)
            if #available(iOS 11.0, *) {
                return lsh.base
                    .constraint(greaterThanOrEqualToSystemSpacingAfter: anchor,
                                multiplier: multiplier)
                    .active
            }
            #endif
        default:
            break
        }
        
        return nil
    }
    
    @discardableResult
    public static func <= (lsh: AnchorWapper<Base>,
                           rsh: LayoutAnchorCombination<Base>) -> NSLayoutConstraint? {
        switch rsh {
        case let .constant(anchor, constant):
            return lsh.base
                .constraint(lessThanOrEqualTo: anchor,
                            constant: constant)
                .active
        case let .multiplier(anchor, multiplier):
            #if os(iOS)
            if #available(iOS 11.0, *) {
                return lsh.base
                    .constraint(lessThanOrEqualToSystemSpacingAfter: anchor,
                                multiplier: multiplier)
                    .active
            }
            #endif
        default:
            break
        }
        
        return nil
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
    
    #if os(iOS)
    @available(iOS 10.0, *)
    @discardableResult
    public static func - (lsh: AnchorWapper<Base>,
                          rsh: AnchorWapper<Base>) -> AnchorWapper<NSLayoutDimension> {
        return lsh.base
            .anchorWithOffset(to: rsh.base)
            .anchor
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    public static func * (lsh: AnchorWapper<Base>,
                          rsh: CGFloat) -> LayoutAnchorCombination<Base> {
        return .multiplier(anchor: lsh.base,
                           multiplier: rsh)
    }
    #endif
}
