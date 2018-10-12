//
//  DeViewController.swift
//  XZBAPPStore
//
//  Created by 🍎上的豌豆 on 2018/10/12.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit
import Hero

class DeViewController: UIViewController {
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    let contentCard = UIView()
    let cardView = CardView()
    let contentView = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        
        view.addSubview(visualEffectView)
        
        contentView.numberOfLines = 0
        contentView.text = "Swift 5版本将在2019年初发布，在这个版本里，二进制兼容性将会稳定下来，意味着编译完的二进制文件可以和其他编译器构建的代码进行互操作，这对于语言的成熟度来说是具有里程碑意义的，将使得苹果能够直接在操作系统中发布Swift运行时，而不需要再包含在App里面，对应用启动速度，运行效率，和对减少应用大小都有很大帮助。"
       contentView.font =  UIFont.init(name: "AppleGothic", size: 26)
        contentView.lineBreakMode = .byWordWrapping
        
        contentCard.backgroundColor = .white
        contentCard.clipsToBounds = true
        
        contentCard.addSubview(contentView)
        contentCard.addSubview(cardView)
        view.addSubview(contentCard)
        
        // add a pan gesture recognizer for the interactive dismiss transition
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan(gr:))))
    }
    

    @objc func handlePan(gr: UIPanGestureRecognizer) {
        let translation = gr.translation(in: view)
        switch gr.state {
        case .began:
            dismiss(animated: true, completion: nil)
        case .changed:
            Hero.shared.update(translation.y / view.bounds.height)
        default:
            let velocity = gr.velocity(in: view)
            if ((translation.y + velocity.y) / view.bounds.height) > 0.5 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let bounds = view.bounds
        visualEffectView.frame  = bounds
        contentCard.frame  = bounds
        cardView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.width)
        contentView.frame = CGRect(x: 20, y: bounds.width + 20, width: bounds.width - 40, height: bounds.height - bounds.width - 20)
    }

}
