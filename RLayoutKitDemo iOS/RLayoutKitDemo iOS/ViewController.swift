//
//  ViewController.swift
//  RLayoutKitDemo iOS
//
//  Created by roy on 2019/3/11.
//  Copyright © 2019 Royite Studio. All rights reserved.
//

import UIKit
import RLayoutKit

// swiftlint:disable all

protocol ViewChainable {}

extension ViewChainable where Self: UIView {
    @discardableResult
    func added(to superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }
}

extension UIView: ViewChainable {}

class ViewController: UIViewController {
    let safeScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        addScrollView()
        addContentView()
    }
    
    func addScrollView() {
        safeScrollView.rl.added(to: view) { (scroll, superview) in
            scroll.safeAreaEdges == superview.safeAreaEdges
        }
        
        safeScrollView.backgroundColor = .black
    }
    
    func addContentView() {
        let contentView = UIView()
        contentView.backgroundColor = UIColor(white: 0.85, alpha: 0.5)
        let spacing: CGFloat = 10
        
        contentView.rl.added(to: safeScrollView) { (background, scroll) in
            background.origin == scroll.contentOrigin + CGSize(width: spacing, height: spacing)
            background.size == scroll.contentSize + CGSize(width: -spacing, height: -spacing * 2)
            background.width == scroll.width - spacing * 2
        }
        
        addSubviews(with: contentView)
    }
    
    func addSubviews(with contentView: UIView) {
        let spacing: CGFloat = 10
        let height: CGFloat = 100
        
        var previous: TestView?
        
        (0...10).forEach { index in
            let i = CGFloat(index)
            
            let testView = TestView(title: "test: \(index)")
                .added(to: contentView)
            
            guard
                let pre = previous
            else {
                testView
                    .rl.layout {
                        $0.leading == contentView.rl.leading + spacing
                        $0.trailing == contentView.rl.trailing - spacing
                        $0.top == contentView.rl.safeAreaTop + spacing
                        $0.height == height
                }
                
                previous = testView
                return
            }
            
            switch i {
            case 1:
                testView
                    .rl.layout {
                        $0.leading == pre.rl.leading + spacing
                        $0.trailing == pre.rl.trailing - spacing
                        $0.top == pre.rl.bottom + spacing
                        $0.height == height + spacing
                }
            case 2:
                testView
                    .rl.layout {
                        $0.leading == pre.rl.leading
                        $0.trailing == pre.rl.trailing - spacing
                        $0.top == pre.rl.bottom + spacing
                        $0.height == height
                }
            case 3:
                testView
                    .rl.layout {
                        $0.leading == pre.rl.leading * spacing
                        $0.trailing == pre.rl.trailing
                        $0.top == pre.rl.bottom + spacing
                        $0.height == height * 1.2 + 30
                }
            case 4:
                testView
                    .rl.layout {
                        $0.edges == pre.rl.edges
                }
            case 5:
                testView
                    .rl.layout {
                        $0.leading == contentView.rl.leading + spacing
                        $0.trailing == contentView.rl.trailing - spacing
                        $0.top == pre.rl.bottom + spacing
                        $0.height == pre.rl.height
                }
            case 6:
                testView
                    .rl.layout {
                        $0.edges == pre.rl.edges + UIEdgeInsets(top: spacing,
                                                                left: 100,
                                                                bottom: spacing,
                                                                right: spacing)
                }
            case 7:
                testView
                    .rl.layout {
                        $0.origin == pre.rl.leadingBottom + CGSize(width: 0, height: spacing * 2)
                        $0.size == pre.rl.size
                }
            case 8:
                testView
                    .rl.layout {
                        $0.size == pre.rl.size * 0.69
                        $0.center == pre.rl.center
                }
            case 9:
                testView
                    .rl.layout {
                        $0.terminal == pre.rl.terminal + CGSize(width: -spacing * 2, height: spacing)
                        $0.width == pre.rl.width * 0.4
                        $0.height == pre.rl.height - spacing
                }
            case 10:
                testView
                    .rl.layout {
                        $0.terminal == pre.rl.terminal + CGSize(width: -spacing * 2, height: spacing)
                        $0.size == CGSize(width: 50, height: 50)
                }
            default:
                break
            }
            
            previous = testView
        }
        
        previous!.rl.layout {
            $0.bottom == contentView.rl.bottom - 10
        }
    }
}
