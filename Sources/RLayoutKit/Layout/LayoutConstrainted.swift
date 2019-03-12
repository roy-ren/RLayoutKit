//
//  LayoutConstrainted.swift
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

protocol LayoutConstraintible: class {
    
    associatedtype AnchorType
    
    var anchor: AnchorType { get set }
    var constant: CGFloat { get set }
}

extension LayoutConstraintible {
    @discardableResult
    public static func + (lsh: Self,
                          rsh: CGFloat) -> Self {
        
        lsh.constant += rsh
        return lsh
    }
    
    @discardableResult
    public static func - (lsh: Self,
                          rsh: CGFloat) -> Self {
        
        lsh.constant -= rsh
        return lsh
    }
    
    @discardableResult
    public static func * (lsh: Self,
                          rsh: CGFloat) -> FulfilledLayoutConstrainted<AnchorType> {
        
        return FulfilledLayoutConstrainted(anchor: lsh.anchor,
                                           multiplier: rsh,
                                           constant: lsh.constant)
    }
}

/// Anchor information, an anchor with a constant
public class BaseLayoutConstrainted<AnchorType>: LayoutConstraintible {
    
    var anchor: AnchorType
    var constant: CGFloat
    
    init(anchor: AnchorType, constant: CGFloat = 0) {
        self.anchor = anchor
        self.constant = constant
    }
}

/// Anchor information, an anchor with a constant and a mutiplier
public class FulfilledLayoutConstrainted<AnchorType>: LayoutConstraintible {
    
    var anchor: AnchorType
    var constant: CGFloat
    var multiplier: CGFloat
    
    init(anchor: AnchorType, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        self.anchor = anchor
        self.multiplier = multiplier
        self.constant = constant
    }
}
