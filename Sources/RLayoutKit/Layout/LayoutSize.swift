//
//  LayoutSize.swift
//  RLayoutKit
//
//  Created by roy on 2019/3/12.
//

import Foundation

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#endif

public struct LayoutSize {
    
    let width: AnchorWrapper<NSLayoutDimension, NSLayoutDimension>
    let height: AnchorWrapper<NSLayoutDimension, NSLayoutDimension>
}

// MARK: - Caculate
extension LayoutSize {
    public static func + (lsh: LayoutSize, rsh: CGSize) -> LayoutSize {
        return LayoutSize(width: lsh.width + rsh.width,
                          height: lsh.height + rsh.height)
    }
    
    public static func - (lsh: LayoutSize, rsh: CGSize) -> LayoutSize {
        return LayoutSize(width: lsh.width - rsh.width,
                          height: lsh.height - rsh.height)
    }
    
    public static func * (lsh: LayoutSize, rsh: CGFloat) -> LayoutSize {
        return LayoutSize(width: lsh.width * rsh,
                          height: lsh.height * rsh)
    }
}

// MARK: - Set to CGSize
extension LayoutSize {
    
    @discardableResult
    public static func == (lsh: LayoutSize, rsh: CGSize) -> [NSLayoutConstraint] {
        return [lsh.width == rsh.width,
                lsh.height == rsh.height]
    }
    
    @discardableResult
    public static func >= (lsh: LayoutSize, rsh: CGSize) -> [NSLayoutConstraint] {
        return [lsh.width >= rsh.width,
                lsh.height >= rsh.height]
    }
    
    @discardableResult
    public static func <= (lsh: LayoutSize, rsh: CGSize) -> [NSLayoutConstraint] {
        return [lsh.width <= rsh.width,
                lsh.height <= rsh.height]
    }
}

// MARK: - Set to LayoutSize
extension LayoutSize {
    @discardableResult
    public static func == (lsh: LayoutSize, rsh: LayoutSize) -> [NSLayoutConstraint] {
        return [lsh.width == rsh.width,
                lsh.height == rsh.height]
    }

    @discardableResult
    public static func >= (lsh: LayoutSize, rsh: LayoutSize) -> [NSLayoutConstraint] {
        return [lsh.width >= rsh.width,
                lsh.height >= rsh.height]
    }
    
    @discardableResult
    public static func <= (lsh: LayoutSize, rsh: LayoutSize) -> [NSLayoutConstraint] {
        return [lsh.width <= rsh.width,
                lsh.height <= rsh.height]
    }
}

extension RLayoutKitWrapper where Base: View {

    public var size: LayoutSize {
        return LayoutSize(width: width,
                        height: height)
    }
}

#if os(iOS)

extension RLayoutKitWrapper where Base: UIScrollView {

    @available(iOS 11.0, *)
    public var contentSize: LayoutSize {
        return LayoutSize(width: contentWidth,
                          height: contentHeight)
    }
}
#endif
