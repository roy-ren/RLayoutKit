////
////  LayoutDimension.swift
////  RLayoutKit
////
////  Created by roy on 2019/3/10.
////
//
//import Foundation
//
//#if os(macOS)
//import AppKit
//#elseif os(iOS)
//import UIKit
//#endif
//
//extension NSLayoutDimension: AnchorCompatible {}
//
////extension AnchorWrapper where Base: NSLayoutDimension {
////    
////    /* These methods return an inactive constraint of the form thisAnchor = otherAnchor.
////     */
////    @discardableResult
////    public static func == (lsh: AnchorWrapper,
////                           rsh: AnchorWrapper) -> NSLayoutConstraint {
////        return lsh.base
////            .constraint(equalTo: rsh.base)
////            .active
////    }
////    
////    @discardableResult
////    public static func >= (lsh: AnchorWrapper,
////                           rsh: AnchorWrapper) -> NSLayoutConstraint {
////        return lsh.base
////            .constraint(greaterThanOrEqualTo: rsh.base)
////            .active
////    }
////    
////    @discardableResult
////    public static func <= (lsh: AnchorWrapper,
////                           rsh: AnchorWrapper) -> NSLayoutConstraint {
////        return lsh.base
////            .constraint(lessThanOrEqualTo: rsh.base)
////            .active
////    }
////}
//
//extension AnchorWrapper where Base: NSLayoutDimension {
//    
//    /* These methods return an inactive constraint of the form thisAnchor = otherAnchor + constant.
//     */
//    @discardableResult
//    public static func == (lsh: AnchorWrapper,
//                           rsh: BaseLayoutConstrainted<Base>) -> NSLayoutConstraint {
//        return lsh.base
//            .constraint(equalTo: rsh.anchor, constant: rsh.constant)
//            .active
//    }
//    
//    @discardableResult
//    public static func >= (lsh: AnchorWrapper,
//                           rsh: BaseLayoutConstrainted<Base>) -> NSLayoutConstraint {
//        return lsh.base
//            .constraint(greaterThanOrEqualTo: rsh.anchor, constant: rsh.constant)
//            .active
//    }
//    
//    @discardableResult
//    public static func <= (lsh: AnchorWrapper,
//                           rsh: BaseLayoutConstrainted<Base>) -> NSLayoutConstraint {
//        return lsh.base
//            .constraint(lessThanOrEqualTo: rsh.anchor, constant: rsh.constant)
//            .active
//    }
//}
//
//// These methods return an inactive constraint of the form thisVariable = | >= | <= constant.
//extension AnchorWrapper where Base: NSLayoutDimension {
//    
//    @discardableResult
//    public static func == (lsh: AnchorWrapper,
//                           rsh: CGFloat) -> NSLayoutConstraint {
//        return lsh.base
//            .constraint(equalToConstant: rsh)
//            .active
//    }
//    
//    @discardableResult
//    public static func >= (lsh: AnchorWrapper,
//                           rsh: CGFloat) -> NSLayoutConstraint {
//        return lsh.base
//            .constraint(greaterThanOrEqualToConstant: rsh)
//            .active
//    }
//    
//    @discardableResult
//    public static func <= (lsh: AnchorWrapper,
//                           rsh: CGFloat) -> NSLayoutConstraint {
//        return lsh.base
//            .constraint(lessThanOrEqualToConstant: rsh)
//            .active
//    }
//}
//
//// These methods return an inactive constraint of the form thisAnchor = | >= | <= otherAnchor * multiplier.
//extension AnchorWrapper where Base: NSLayoutDimension {
//    
//    @discardableResult
//    public static func == (lsh: AnchorWrapper,
//                           rsh: FulfilledLayoutConstrainted<Base>) -> NSLayoutConstraint {
//        
//        return lsh.base
//            .constraint(equalTo: rsh.anchor,
//                        multiplier: rsh.multiplier,
//                        constant: rsh.constant)
//            .active
//    }
//    
//    @discardableResult
//    public static func >= (lsh: AnchorWrapper,
//                           rsh: FulfilledLayoutConstrainted<Base>) -> NSLayoutConstraint {
//        
//        return lsh.base
//            .constraint(greaterThanOrEqualTo: rsh.anchor,
//                        multiplier: rsh.multiplier,
//                        constant: rsh.constant)
//            .active
//    }
//    
//    @discardableResult
//    public static func <= (lsh: AnchorWrapper,
//                           rsh: FulfilledLayoutConstrainted<Base>) -> NSLayoutConstraint {
//        return lsh.base
//            .constraint(lessThanOrEqualTo: rsh.anchor,
//                        multiplier: rsh.multiplier,
//                        constant: rsh.constant)
//            .active
//    }
//}
