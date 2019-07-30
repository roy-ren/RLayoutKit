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

extension AnchorWrapper where Base: NSLayoutXAxisAnchor {
    
    @discardableResult
    public static func - (lsh: AnchorWrapper,
                          rsh: AnchorWrapper) -> AnchorWrapper<NSLayoutDimension> {
        return lsh.base
            .anchorWithOffset(to: rsh.base)
            .aw
    }
}

extension AnchorWrapper where Base: NSLayoutXAxisAnchor {
    
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

//extension AnchorWrapper where Base: NSLayoutXAxisAnchor {
//    
//    /* These methods return an inactive constraint of the form thisAnchor = otherAnchor.
//     */
//    func equalToSuper(constant: CGFloat) -> NSLayoutConstraint? {
//        guard let superAnchor = superAnchor else {
//            return nil
//        }
//        
//        return base.constraint(equalTo: superAnchor, constant: constant).active
//    }
//    
//    @discardableResult
//    func greaterThanOrEqualToSuper(constant: CGFloat) -> NSLayoutConstraint? {
//        guard let superAnchor = superAnchor else {
//            return nil
//        }
//        
//        return base.constraint(greaterThanOrEqualTo: superAnchor, constant: constant).active
//    }
//    
//    @discardableResult
//    func lessThanOrEqualToSuper(constant: CGFloat) -> NSLayoutConstraint? {
//        guard let superAnchor = superAnchor else {
//            return nil
//        }
//        
//        return base.constraint(lessThanOrEqualTo: superAnchor, constant: constant).active
//    }
//}

extension AnchorWrapper where Base: NSLayoutXAxisAnchor {
    
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

extension AnchorWrapper where Base: NSLayoutXAxisAnchor {
    
    @discardableResult
    public static func == (lsh: AnchorWrapper,
                           rsh: FulfilledLayoutConstrainted<Base>) -> NSLayoutConstraint? {
        
        return lsh.base
            .constraint(equalToSystemSpacingAfter: rsh.anchor,
                        multiplier: rsh.multiplier)
            .active
    }
    
    @discardableResult
    public static func >= (lsh: AnchorWrapper,
                           rsh: FulfilledLayoutConstrainted<Base>) -> NSLayoutConstraint {
        
        return lsh.base
            .constraint(greaterThanOrEqualToSystemSpacingAfter: rsh.anchor,
                        multiplier: rsh.multiplier)
            .active
    }
    
    @discardableResult
    public static func <= (lsh: AnchorWrapper,
                           rsh: FulfilledLayoutConstrainted<Base>) -> NSLayoutConstraint {
        
        return lsh.base
            .constraint(lessThanOrEqualToSystemSpacingAfter: rsh.anchor,
                        multiplier: rsh.multiplier)
            .active
    }
}
#endif
