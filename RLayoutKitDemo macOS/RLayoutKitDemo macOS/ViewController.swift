//
//  ViewController.swift
//  RLayoutKitDemo macOS
//
//  Created by roy on 2019/3/12.
//  Copyright © 2019 Royite Studio. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    private let tmpView = NSView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

    private func test() {
        tmpView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    }
}
