//
//  CardView.swift
//  XZBAPPStore
//
//  Created by 🍎上的豌豆 on 2018/10/12.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit

class CardView: UIView {

    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let imageView = UIImageView.init()
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        subtitleLabel.font = UIFont.systemFont(ofSize: 16)
        imageView.contentMode = .scaleAspectFill
        
        addSubview(imageView)
        addSubview(visualEffectView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        visualEffectView.frame = CGRect(x: 0, y:  bounds.height - 90, width: bounds.width, height: 90)
        titleLabel.frame = CGRect(x: 20, y: bounds.height - 70, width: bounds.width - 40, height: 30)
        subtitleLabel.frame = CGRect(x: 20, y: bounds.height - 40, width: bounds.width - 40, height: 30)
    }

}
