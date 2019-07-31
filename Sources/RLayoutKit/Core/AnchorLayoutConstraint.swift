//
//  AnchorLayoutConstraint.swift
//  RLayoutKit-macOS
//
//  Created by roy on 2019/7/31.
//

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#endif

import Foundation
infix operator ==+: ComparisonPrecedence
infix operator ==*: ComparisonPrecedence
infix operator >=+: ComparisonPrecedence
infix operator >=*: ComparisonPrecedence
infix operator <=+: ComparisonPrecedence
infix operator <=*: ComparisonPrecedence

// MARK: - Commont Constraint
extension AnchorWrapper {
    @discardableResult
    public static func == (lsh: AnchorWrapper,
                           rsh: AnchorWrapper) -> NSLayoutConstraint {
        if .none != rsh.multiplier { return lsh ==* rsh }
        if .none != rsh.constant { return lsh ==+ rsh }
        return lsh.anchor.constraint(equalTo: rsh.anchor).active
    }
    
    static func ==+ (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        return lsh.anchor.constraint(equalTo: rsh.anchor,
                                     constant: rsh.constant!)
    }
    
    static func ==* (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        if let lshAnchor = lsh.anchor as? NSLayoutXAxisAnchor,
            let rshAnchor = rsh.anchor as? NSLayoutXAxisAnchor,
            let multiplier = rsh.multiplier {
            
            return lshAnchor.constraint(equalToSystemSpacingAfter: rshAnchor,
                                        multiplier: multiplier)
        }
        
        if let lshAnchor = lsh.anchor as? NSLayoutYAxisAnchor,
            let rshAnchor = rsh.anchor as? NSLayoutYAxisAnchor,
            let multiplier = rsh.multiplier {
            
            return lshAnchor.constraint(equalToSystemSpacingBelow: rshAnchor,
                                        multiplier: multiplier)
        }

        if let lshAnchor = lsh.anchor as? NSLayoutDimension,
            let rshAnchor = rsh.anchor as? NSLayoutDimension,
            let multiplier = rsh.multiplier,
            let constant = rsh.constant {
            
            return lshAnchor.constraint(equalTo: rshAnchor,
                                        multiplier: multiplier,
                                        constant: constant)
        }
        
        return lsh.anchor.constraint(equalTo: rsh.anchor)
    }
}
    
extension AnchorWrapper {
    @discardableResult
    public static func >= (lsh: AnchorWrapper,
                           rsh: AnchorWrapper) -> NSLayoutConstraint {
        if .none != rsh.multiplier { return lsh ==* rsh }
        if .none != rsh.constant { return lsh ==+ rsh }
        return lsh.anchor.constraint(greaterThanOrEqualTo: rsh.anchor)
    }
    
    static func >=+ (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        return lsh.anchor.constraint(greaterThanOrEqualTo: rsh.anchor, constant: rsh.constant!)
    }
    
    static func >=* (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        if let lshAnchor = lsh.anchor as? NSLayoutXAxisAnchor,
            let rshAnchor = rsh.anchor as? NSLayoutXAxisAnchor,
            let multiplier = rsh.multiplier {
            
            return lshAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: rshAnchor,
                                        multiplier: multiplier)
        }
        
        if let lshAnchor = lsh.anchor as? NSLayoutYAxisAnchor,
            let rshAnchor = rsh.anchor as? NSLayoutYAxisAnchor,
            let multiplier = rsh.multiplier {
            
            return lshAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: rshAnchor,
                                        multiplier: multiplier)
        }

        if let lshAnchor = lsh.anchor as? NSLayoutDimension,
            let rshAnchor = rsh.anchor as? NSLayoutDimension,
            let multiplier = rsh.multiplier,
            let constant = rsh.constant {
            
            return lshAnchor.constraint(greaterThanOrEqualTo: rshAnchor,
                                        multiplier: multiplier,
                                        constant: constant)
        }
        
        return lsh.anchor.constraint(greaterThanOrEqualTo: rsh.anchor)
    }
}

extension AnchorWrapper {
    @discardableResult
    public static func <= (lsh: AnchorWrapper,
                           rsh: AnchorWrapper) -> NSLayoutConstraint {
        if .none != rsh.multiplier { return lsh ==* rsh }
        if .none != rsh.constant { return lsh ==+ rsh }
        return lsh.anchor.constraint(lessThanOrEqualTo: rsh.anchor)
    }
    
    static func <=+ (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        return lsh.anchor.constraint(lessThanOrEqualTo: rsh.anchor, constant: rsh.constant!)
    }
    
    static func <=* (lsh: AnchorWrapper,
                     rsh: AnchorWrapper) -> NSLayoutConstraint {
        if let lshAnchor = lsh.anchor as? NSLayoutXAxisAnchor,
            let rshAnchor = rsh.anchor as? NSLayoutXAxisAnchor,
            let multiplier = rsh.multiplier {
            
            return lshAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: rshAnchor,
                                        multiplier: multiplier)
        }
        
        if let lshAnchor = lsh.anchor as? NSLayoutYAxisAnchor,
            let rshAnchor = rsh.anchor as? NSLayoutYAxisAnchor,
            let multiplier = rsh.multiplier {
            
            return lshAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: rshAnchor,
                                        multiplier: multiplier)
        }

        if let lshAnchor = lsh.anchor as? NSLayoutDimension,
            let rshAnchor = rsh.anchor as? NSLayoutDimension,
            let multiplier = rsh.multiplier,
            let constant = rsh.constant {
            
            return lshAnchor.constraint(lessThanOrEqualTo: rshAnchor,
                                        multiplier: multiplier,
                                        constant: constant)
        }
        
        return lsh.anchor.constraint(lessThanOrEqualTo: rsh.anchor)
    }
}

//extension AnchorWrapper where AnchorType == NSLayoutDimension, Anchor: NSLayoutDimension {
//    static func == (lsh: AnchorWrapper<NSLayoutDimension, NSLayoutAnchor<NSLayoutDimension>>, rsh: CGFloat) -> NSLayoutConstraint {
////        return lsh.anchor.constraint(equalToConstant: rsh)
//        lsh.anchor.cons
//    }
//
//    static func >= (lsh: AnchorWrapper, rsh: CGFloat) -> NSLayoutConstraint {
//        return lsh.anchor.constraint(greaterThanOrEqualToConstant: rsh)
//    }
//
//    static func <= (lsh: AnchorWrapper, rsh: CGFloat) -> NSLayoutConstraint {
//        return lsh.anchor.constraint(lessThanOrEqualToConstant: rsh)
//    }
//}
//
//
//func test() {
//    let background = View()
//    let width: CGFloat = 100
//
//    View().rl.added(to: background) { (left, right) in
//        left.width == 100
//    }
//}

struct Anchor<A, B: NSLayoutAnchor<A>> {
    let anchor: A
    let anchorb: B
    
    init(_ a: A, b: B) {
        self.anchor = a
        self.anchorb = b
    }
    
    func test() {
        anchorb.constraint(equalTo: anchorb)
    }
}
