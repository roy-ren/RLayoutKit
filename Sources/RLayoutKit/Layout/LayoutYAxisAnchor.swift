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

@available(iOS 9.0, *)
extension NSLayoutYAxisAnchor: AnchorCompatible {}

@available(iOS 9.0, *)
extension AnchorWrapper where Base: NSLayoutYAxisAnchor {
    
    @available(iOS 10.0, *)
    @discardableResult
    public static func - (lsh: AnchorWrapper,
                          rsh: AnchorWrapper) -> AnchorWrapper<NSLayoutDimension> {
        return lsh.base
            .anchorWithOffset(to: rsh.base)
            .aw
    }
}

@available(iOS 9.0, *)
extension AnchorWrapper where Base: NSLayoutYAxisAnchor {
    
    /* These methods return an inactive constraint of the form thisAnchor = otherAnchor.
     */
    @discardableResult
    public static func == (lsh: AnchorWrapper,
                           rsh: AnchorWrapper) -> NSLayoutConstraint {
        return lsh.base
            .constraint(equalTo: rsh.base)
            .active
    }
    
    @discardableResult
    public static func >= (lsh: AnchorWrapper,
                           rsh: AnchorWrapper) -> NSLayoutConstraint {
        return lsh.base
            .constraint(greaterThanOrEqualTo: rsh.base)
            .active
    }
    
    @discardableResult
    public static func <= (lsh: AnchorWrapper,
                           rsh: AnchorWrapper) -> NSLayoutConstraint {
        return lsh.base
            .constraint(lessThanOrEqualTo: rsh.base)
            .active
    }
}

@available(iOS 9.0, *)
extension AnchorWrapper where Base: NSLayoutYAxisAnchor {
    
    /* These methods return an inactive constraint of the form thisAnchor = otherAnchor + constant.
     */
    @discardableResult
    public static func == (lsh: AnchorWrapper,
                           rsh: BaseLayoutConstrainted<Base>) -> NSLayoutConstraint {
        return lsh.base
            .constraint(equalTo: rsh.anchor, constant: rsh.constant)
            .active
    }
    
    @discardableResult
    public static func >= (lsh: AnchorWrapper,
                           rsh: BaseLayoutConstrainted<Base>) -> NSLayoutConstraint {
        return lsh.base
            .constraint(greaterThanOrEqualTo: rsh.anchor, constant: rsh.constant)
            .active
    }
    
    @discardableResult
    public static func <= (lsh: AnchorWrapper,
                           rsh: BaseLayoutConstrainted<Base>) -> NSLayoutConstraint {
        return lsh.base
            .constraint(lessThanOrEqualTo: rsh.anchor, constant: rsh.constant)
            .active
    }
}

#if os(iOS)
@available(iOS 11.0, *)
extension AnchorWrapper where Base: NSLayoutYAxisAnchor {
    
    @discardableResult
    public static func == (lsh: AnchorWrapper,
                           rsh: FulfilledLayoutConstrainted<Base>) -> NSLayoutConstraint? {
        
        return lsh.base
            .constraint(equalToSystemSpacingBelow: rsh.anchor,
                        multiplier: rsh.multiplier)
            .active
    }
    
    @discardableResult
    public static func >= (lsh: AnchorWrapper,
                           rsh: FulfilledLayoutConstrainted<Base>) -> NSLayoutConstraint {
        
        return lsh.base
            .constraint(greaterThanOrEqualToSystemSpacingBelow: rsh.anchor,
                        multiplier: rsh.multiplier)
            .active
    }
    
    @discardableResult
    public static func <= (lsh: AnchorWrapper,
                           rsh: FulfilledLayoutConstrainted<Base>) -> NSLayoutConstraint {
        
        return lsh.base
            .constraint(lessThanOrEqualToSystemSpacingBelow: rsh.anchor,
                        multiplier: rsh.multiplier)
            .active
    }
}
#endif
