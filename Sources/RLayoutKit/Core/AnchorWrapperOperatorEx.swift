//
//  AnchorWrapperOperatorEx.swift
//  RLayoutKit-macOS
//
//  Created by roy on 2019/7/31.
//

import Foundation

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#endif

extension AnchorWrapper {
    public static func + (lsh: AnchorWrapper,
                          rsh: CGFloat) -> AnchorWrapper {
        var anchorWrapper = lsh
        anchorWrapper.constant = (lsh.constant ?? 0) + rsh
        return lsh
    }
    
    @discardableResult
    public static func - (lsh: AnchorWrapper,
                          rsh: CGFloat) -> AnchorWrapper {
        
        var anchorWrapper = lsh
        anchorWrapper.constant = (lsh.constant ?? 0) - rsh
        return lsh
    }
    
    @discardableResult
    public static func * (lsh: AnchorWrapper,
                          rsh: CGFloat) -> AnchorWrapper {
        
        var anchorWrapper = lsh
        anchorWrapper.multiplier = (lsh.multiplier ?? 1) * rsh
        return lsh
    }
}
