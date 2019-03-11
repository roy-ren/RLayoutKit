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
//        normalTest()
    }
    
    func normalTest() {
        let spacing: CGFloat = 10
        let height: CGFloat = 50
        
        (0...10).forEach { index in
            let i = CGFloat(index)
            if index <= 5 {
                TestView(title: "normal: \(index)")
                    .added(to: self.safeBackgroundView)
                    .rl.layout {
                        $0.leading == self.safeBackgroundView.rl.leading + spacing * i + spacing
                        $0.trailing == self.safeBackgroundView.rl.trailing - i * spacing
                        $0.top == self.safeBackgroundView.rl.safeAreaTop + i * (spacing + height) + spacing
                        $0.height == height
                }
            } else {
                TestView(title: "title: \(index)")
                    .added(to: self.safeBackgroundView)
                    .rl.layout {
                        $0.leading == self.safeBackgroundView.rl.leading * 0.5
                        $0.trailing == self.safeBackgroundView.rl.trailing - i * spacing
                        $0.top == self.safeBackgroundView.rl.safeAreaTop * 0.5 + i * (spacing + height) + spacing
                        $0.height == height
                }
            }
        }
    }
    
    func safeAreaTest() {
        safeBackgroundView.backgroundColor = .white
        
        safeBackgroundView.added(to: view)
            .rl.layout {
                $0.top == self.view.rl.safeAreaTop
                $0.leading == self.view.rl.safeAreaLeading
                $0.bottom == self.view.rl.safeAreaBottom
                $0.trailing == self.view.rl.safeAreaTrailing
        }
        
        TestView(title: "Nice").sup
//            .added(to: safeBackgroundView)
//            .rl.layout {
//            $0.leading == 10
//        }
    }
}
