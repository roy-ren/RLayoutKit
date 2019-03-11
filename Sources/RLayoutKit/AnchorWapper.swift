//
//  AnchorWapper.swift
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

// MARK: AnchorWapper

/**
 A Structure for containing subclasses of type
 [NSLayoutAnchor](https://developer.apple.com/documentation/uikit/nslayoutconstraint),
 used by combining AnchorCompatible
 - Example
 ````
 extension NSLayoutXAxisAnchor: AnchorCompatible {}
 
 let view = View()
 let anAnchorWapper: AnchorWapper<NSLayoutXAxisAnchor> = view.leadingAnchor.anchor
 ````
 */
public struct AnchorWapper<Base> {
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

/**
 A protocol followed by subclasses of type
 [NSLayoutAnchor](https://developer.apple.com/documentation/uikit/nslayoutconstraint)
 
 - Example
 ````
 extension NSLayoutXAxisAnchor: AnchorCompatible {}
 
 let view = View()
 let anAnchorWapper: AnchorWapper<NSLayoutXAxisAnchor> = view.leadingAnchor.anchor
 ````
 */
public protocol AnchorCompatible {}

extension AnchorCompatible {
    
    /// An instance of type `Self` wrapped with an `AnchorWapper` container
    var anchor: AnchorWapper<Self> {
        return AnchorWapper<Self>(self)
    }
}

extension NSLayoutConstraint {
    var active: NSLayoutConstraint {
        isActive = true
        return self
    }
    
    var inactive: NSLayoutConstraint {
        isActive = false
        return self
    }
}
