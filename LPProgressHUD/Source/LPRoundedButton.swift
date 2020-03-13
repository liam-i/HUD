//
//  LPRoundedButton.swift
//  LPProgressHUD <https://github.com/leo-lp/LPProgressHUD>
//
//  Created by 李鹏 on 2017/6/1.
//  Copyright © 2017年 Zhejiang lp Technology Co., Ltd. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class LPRoundedButton: UIButton {
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 1.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.borderWidth = 1.0
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Fully rounded corners
        layer.cornerRadius = ceil(bounds.height / 2.0)
    }
    
    override var intrinsicContentSize: CGSize {
        // Only show if we have associated control events and a title
        if allControlEvents.rawValue == 0 || title(for: .normal)?.count == 0 {
            return .zero
        }
        
        var size = super.intrinsicContentSize
        size.width += 20.0 // Add some side padding
        return size
    }
    
    // MARK: - Color
    
    override func setTitleColor(_ color: UIColor?, for state: UIControl.State) {
        super.setTitleColor(color, for: state)
        // Update related colors
        let highlighted = isHighlighted
        isHighlighted = highlighted
        layer.borderColor = color?.cgColor
    }
    
    override var isHighlighted: Bool {
        didSet {
            let baseColor = titleColor(for: .selected)
            backgroundColor = isHighlighted ? baseColor?.withAlphaComponent(0.1) : UIColor.clear
        }
    }
}