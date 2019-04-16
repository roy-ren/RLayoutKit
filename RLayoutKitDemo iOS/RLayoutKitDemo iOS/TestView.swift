//
//  TestView.swift
//  RLayoutKitDemo iOS
//
//  Created by roy on 2019/3/11.
//  Copyright © 2019 Royite Studio. All rights reserved.
//

import UIKit
import RLayoutKit

// swiftlint:disable all
class TestView: UILabel {
    init(frame: CGRect = .zero, title: String) {
        super.init(frame: frame)
        
        textColor = .black
        text = title
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        
        adjustsFontSizeToFitWidth = true
        
        let red = CGFloat.random(in: 0...255) / 255
        let green = CGFloat.random(in: 0...255) / 255
        let blue = CGFloat.random(in: 0...255) / 255
        
        backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
