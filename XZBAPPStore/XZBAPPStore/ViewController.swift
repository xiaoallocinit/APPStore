//
//  ViewController.swift
//  XZBAPPStore
//
//  Created by 🍎上的豌豆 on 2018/10/12.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit
import Hero
import CollectionKit

class ViewController: UIViewController {
    let collectionView = CollectionView()
    let dataProvider = ArrayDataProvider<Int>(data: Array(0..<3))
    let titleArr = ["苹果手机","苹果手表","苹果笔记本"]
    let subtitleArr = ["苹果上的豌豆","手表的豌豆","App Store"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.provider = CollectionProvider(
            dataProvider: dataProvider,
            viewUpdater: { (view: RoundedCardWrapperView, data: Int, index: Int) in
                view.cardView.titleLabel.text = self.titleArr[data]
                view.cardView.subtitleLabel.text = self.subtitleArr[data]
                view.cardView.imageView.image = UIImage(named: "iphone\(data)")
        },
            layout: FlowLayout(spacing: 30).inset(by: UIEdgeInsets(top: 40, left: 20, bottom: 30, right: 20)),
            sizeProvider: { (index, data, collectionSize) in
                return CGSize(width: collectionSize.width, height: collectionSize.width + 20)
        },
            tapHandler: { [weak self] (view, index, dataProvider) in
                self?.cellTapped(cell: view, data: dataProvider.data(at: index))
            }
        )
        collectionView.delaysContentTouches = false
        self.view.addSubview(collectionView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func cellTapped(cell: RoundedCardWrapperView, data: Int) {
        // MARK: Hero configuration

        let cardHeroId = "card\(data)"
        cell.cardView.hero.modifiers = [.useNoSnapshot, .spring(stiffness: 250, damping: 25)]
        cell.cardView.hero.id = cardHeroId
        
        let vc = DeViewController()
        
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .none
        
        vc.cardView.hero.id = cardHeroId
        vc.cardView.hero.modifiers = [.useNoSnapshot, .spring(stiffness: 250, damping: 25)]
        
        vc.cardView.titleLabel.text = self.titleArr[data]
        vc.cardView.subtitleLabel.text = self.subtitleArr[data]
        vc.cardView.imageView.image = UIImage(named: "iphone\(data)")
        
        vc.contentCard.hero.modifiers = [.source(heroID: cardHeroId), .spring(stiffness: 250, damping: 25)]
        
        vc.contentView.hero.modifiers = [.useNoSnapshot, .forceAnimate, .spring(stiffness: 250, damping: 25)]
        
        vc.visualEffectView.hero.modifiers = [.fade, .useNoSnapshot]
        
        present(vc, animated: true, completion: nil)
    }
}

