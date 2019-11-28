//
//  ViewSafeAreaAnchors.swift
//  RLayoutKit
//
//  Created by roy on 2019/3/11.
//

import Foundation

#if os(iOS)
import UIKit

@available(iOS 11.0, *)
extension RLayoutKitWrapper where Base: View {
	
	public var safeAreaGuide: UILayoutGuide {
		return base
			.safeAreaLayoutGuide
	}
	
	public var superSafeAreaGuide: UILayoutGuide? {
		return base
			.superView?
			.safeAreaLayoutGuide
	}
	
	public var safeAreaLeading: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
		return .init(
			anchor: safeAreaGuide.leadingAnchor,
			superAnchor: superSafeAreaGuide?.leadingAnchor
		)
	}
	
	public var safeAreaTrailing: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
		return .init(
			anchor: safeAreaGuide.trailingAnchor,
			superAnchor: superSafeAreaGuide?.trailingAnchor
		)
	}
	
	public var safeAreaLeft: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
		return .init(
			anchor: safeAreaGuide.leftAnchor,
			superAnchor: superSafeAreaGuide?.leftAnchor
		)
	}
	
	public var safeAreaRight: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
		return .init(
			anchor: safeAreaGuide.rightAnchor,
			superAnchor: superSafeAreaGuide?.rightAnchor
		)
	}
	
	public var safeAreaTop: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
		return .init(
			anchor: safeAreaGuide.topAnchor,
			superAnchor: superSafeAreaGuide?.topAnchor
		)
	}
	
	public var safeAreaBottom: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
		return .init(
			anchor: safeAreaGuide.bottomAnchor,
			superAnchor: superSafeAreaGuide?.bottomAnchor
		)
	}
	
	public var safeAreaWidth: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
		return .init(
			anchor: safeAreaGuide.widthAnchor,
			superAnchor: superSafeAreaGuide?.widthAnchor
		)
	}
	
	public var safeAreaHeight: AnchorWrapper<NSLayoutDimension, NSLayoutDimension> {
		return .init(
			anchor: safeAreaGuide.heightAnchor,
			superAnchor: superSafeAreaGuide?.heightAnchor
		)
	}
	
	public var safeAreaCenterX: AnchorWrapper<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
		return .init(
			anchor: safeAreaGuide.centerXAnchor,
			superAnchor: superSafeAreaGuide?.centerXAnchor
		)
	}
	
	public var safeAreaCenterY: AnchorWrapper<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
		return .init(
			anchor: safeAreaGuide.centerYAnchor,
			superAnchor: superSafeAreaGuide?.centerYAnchor
		)
	}
}
#endif
