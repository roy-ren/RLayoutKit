//
//  LayoutBase.swift
//  RLayoutKit
//
//  Created by roy on 2019/8/1.
//

import Foundation

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#endif

infix operator ==+: ComparisonPrecedence
infix operator ==*: ComparisonPrecedence
infix operator >=+: ComparisonPrecedence
infix operator >=*: ComparisonPrecedence
infix operator <=+: ComparisonPrecedence
infix operator <=*: ComparisonPrecedence

extension NSLayoutConstraint {
    
    public var active: NSLayoutConstraint {
        isActive = true
        return self
    }
    
    public var inactive: NSLayoutConstraint {
        isActive = false
        return self
    }
}

// MARK: - Commont Constraint, equalTo: E.g: ==
// swiftlint:disable all
extension AnchorWrapper {
    @discardableResult
    public static func == (lsh: AnchorWrapper,
                           rsh: AnchorWrapper) -> NSLayoutConstraint {
        
        switch (rsh.multiplier, rsh.constant) {
        case (.some, _):
            return lsh ==* rsh
        case (.none, .some):
            return lsh ==+ rsh
        default:
            return lsh
                .anchor
                .constraint(equalTo: rsh.anchor)
                .active
        }
    }
    
    static func ==+ (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        return lsh
            .anchor
            .constraint(equalTo: rsh.anchor,
                        constant: rsh.constant!)
            .active
    }
    
    static func ==* (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        
        switch Anchor.self {
        case is NSLayoutXAxisAnchor.Type:
            return (lsh.anchor as! NSLayoutXAxisAnchor)
                .constraint(equalToSystemSpacingAfter: (rsh.anchor as! NSLayoutXAxisAnchor),
                            multiplier: rsh.multiplier!)
                .active
        case is NSLayoutYAxisAnchor.Type:
            return (lsh.anchor as! NSLayoutYAxisAnchor)
                .constraint(equalToSystemSpacingBelow: (rsh.anchor as! NSLayoutYAxisAnchor),
                            multiplier: rsh.multiplier!)
                .active
        case is NSLayoutDimension.Type:
            return (lsh.anchor as! NSLayoutDimension)
                .constraint(equalTo: (rsh.anchor as! NSLayoutDimension),
                            multiplier: rsh.multiplier!,
                            constant: rsh.constant ?? 0)
                .active
        default:
            return lsh
                .anchor
                .constraint(equalTo: rsh.anchor)
                .active
        }
    }
}

// MARK: - greaterThanOrEqualTo E.g: >=
extension AnchorWrapper {
    @discardableResult
    public static func >= (lsh: AnchorWrapper,
                           rsh: AnchorWrapper) -> NSLayoutConstraint {
        switch (rsh.multiplier, rsh.constant) {
        case (.some, _):
            return lsh >=* rsh
        case (.none, .some):
            return lsh >=+ rsh
        default:
            return lsh
                .anchor
                .constraint(greaterThanOrEqualTo: rsh.anchor)
                .active
        }
    }
    
    static func >=+ (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        return lsh
            .anchor
            .constraint(greaterThanOrEqualTo: rsh.anchor,
                        constant: rsh.constant!)
            .active
    }
    
    static func >=* (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        
        switch Anchor.self {
        case is NSLayoutXAxisAnchor.Type:
            return (lsh.anchor as! NSLayoutXAxisAnchor)
                .constraint(greaterThanOrEqualToSystemSpacingAfter: (rsh.anchor as! NSLayoutXAxisAnchor),
                            multiplier: rsh.multiplier!)
                .active
        case is NSLayoutYAxisAnchor.Type:
            return (lsh.anchor as! NSLayoutYAxisAnchor)
                .constraint(greaterThanOrEqualToSystemSpacingBelow: (rsh.anchor as! NSLayoutYAxisAnchor),
                            multiplier: rsh.multiplier!)
                .active
        case is NSLayoutDimension.Type:
            return (lsh.anchor as! NSLayoutDimension)
                .constraint(greaterThanOrEqualTo: (rsh.anchor as! NSLayoutDimension),
                            multiplier: rsh.multiplier!,
                            constant: rsh.constant ?? 0)
                .active
        default:
            return lsh
                .anchor
                .constraint(greaterThanOrEqualTo: rsh.anchor)
                .active
        }
    }
}

// MARK: - lessThanOrEqualTo E.g: <=
extension AnchorWrapper {
    @discardableResult
    public static func <= (lsh: AnchorWrapper,
                           rsh: AnchorWrapper) -> NSLayoutConstraint {
        
        switch (rsh.multiplier, rsh.constant) {
        case (.some, _):
            return lsh <=* rsh
        case (.none, .some):
            return lsh <=+ rsh
        default:
            return lsh
                .anchor
                .constraint(lessThanOrEqualTo: rsh.anchor)
                .active
        }
    }
    
    static func <=+ (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        return lsh
            .anchor
            .constraint(lessThanOrEqualTo: rsh.anchor,
                        constant: rsh.constant!)
            .active
    }
    
    static func <=* (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        
        switch Anchor.self {
        case is NSLayoutXAxisAnchor.Type:
            return (lsh.anchor as! NSLayoutXAxisAnchor)
                .constraint(lessThanOrEqualToSystemSpacingAfter: (rsh.anchor as! NSLayoutXAxisAnchor),
                            multiplier: rsh.multiplier!)
                .active
        case is NSLayoutYAxisAnchor.Type:
            return (lsh.anchor as! NSLayoutYAxisAnchor)
                .constraint(lessThanOrEqualToSystemSpacingBelow: (rsh.anchor as! NSLayoutYAxisAnchor),
                            multiplier: rsh.multiplier!)
                .active
        case is NSLayoutDimension.Type:
            return (lsh.anchor as! NSLayoutDimension)
                .constraint(lessThanOrEqualTo: (rsh.anchor as! NSLayoutDimension),
                            multiplier: rsh.multiplier!,
                            constant: rsh.constant ?? 0)
                .active
        default:
            return lsh
                .anchor
                .constraint(lessThanOrEqualTo: rsh.anchor)
                .active
        }
    }
}

extension AnchorWrapper where A == NSLayoutYAxisAnchor, Anchor == NSLayoutYAxisAnchor {
    static func - (lsh: AnchorWrapper, rsh: AnchorWrapper) -> NSLayoutDimension {
        return lsh
            .anchor
            .anchorWithOffset(to: rsh.anchor)
    }
}

extension AnchorWrapper where A == NSLayoutXAxisAnchor, Anchor == NSLayoutXAxisAnchor {
    static func - (lsh: AnchorWrapper, rsh: AnchorWrapper) -> NSLayoutDimension {
        return lsh
            .anchor
            .anchorWithOffset(to: rsh.anchor)
    }
}

extension AnchorWrapper where A == NSLayoutDimension, Anchor == NSLayoutDimension {
    @discardableResult
    public static func == (lsh: AnchorWrapper, rsh: CGFloat) -> NSLayoutConstraint {
        return lsh
            .anchor
            .constraint(equalToConstant: rsh)
            .active
    }
    
    @discardableResult
    public static func >= (lsh: AnchorWrapper, rsh: CGFloat) -> NSLayoutConstraint {
        return lsh
            .anchor
            .constraint(greaterThanOrEqualToConstant: rsh)
            .active
    }
    
    @discardableResult
    public static func <= (lsh: AnchorWrapper, rsh: CGFloat) -> NSLayoutConstraint {
        return lsh
            .anchor
            .constraint(lessThanOrEqualToConstant: rsh)
            .active
    }
}
