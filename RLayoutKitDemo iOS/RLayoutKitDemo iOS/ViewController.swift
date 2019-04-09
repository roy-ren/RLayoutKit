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
    let safeBackgroundView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        safeAreaTest()
        normalTest()
    }
    
    func normalTest() {
        let spacing: CGFloat = 10
        let height: CGFloat = 40
        
        var previous: TestView?
        
        (0...10).forEach { index in
            let i = CGFloat(index)
            
            let testView = TestView(title: "test: \(index)").added(to: self.safeBackgroundView)
            testView.backgroundColor = UIColor(red: (i * 15 + 20).truncatingRemainder(dividingBy: 255) / 255,
                                               green: (i * 100 + 50).truncatingRemainder(dividingBy: 255) / 255,
                                               blue: (i * 45 + 90).truncatingRemainder(dividingBy: 255) / 255,
                                               alpha: 1)
            
            guard
                let pre = previous
            else {
                testView
                    .rl.layout {
                        $0.leading == self.safeBackgroundView.rl.leading + spacing
                        $0.trailing == self.safeBackgroundView.rl.trailing - spacing
                        $0.top == self.safeBackgroundView.rl.safeAreaTop + spacing
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
                        $0.top == pre.rl.bottom - spacing
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
                        $0.leading == self.safeBackgroundView.rl.leading + spacing
                        $0.trailing == self.safeBackgroundView.rl.trailing - spacing
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
                        $0.leadingBottom == self.safeBackgroundView.rl.leadingBottom + CGSize(width: spacing, height: -spacing)
                        $0.trialingTop == pre.rl.trialingBottom + CGSize(width: spacing, height: spacing * 2)
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
    }
    
    func safeAreaTest() {
        safeBackgroundView.backgroundColor = .white
        
        safeBackgroundView.added(to: view)
            .rl.layout {
                $0.edges == self.view.rl.safeAreaEdges
        }
    }
}
