//
//  CardTestCell.swift
//  Cardx
//
//  Created by Xchel Carranza on 04/07/23.
//

import UIKit

class CardCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    var cardItem: CardItem? = nil
//    func bind(difficultyDelegate: CardItemDifficultyDelegate, card: Card, index: Int) {
//        if cardItem == nil {
//            self.cardItem = CardItem(
//                card: card,
//                difficultyDelegate: difficultyDelegate,
//                index: index
//            )
//            self.addSubview(cardItem!)
//            NSLayoutConstraint.activate([
//                cardItem!.topAnchor.constraint(equalTo: topAnchor),
//                cardItem!.leadingAnchor.constraint(equalTo: leadingAnchor),
//                cardItem!.trailingAnchor.constraint(equalTo: trailingAnchor)
//            ])
//        } else {
//            self.cardItem?.updateData(card: card, index: index)
//        }
//    }
    
    func bind(difficultyDelegate: CardItemDifficultyDelegate, card: Card, indexPath: IndexPath) {
        if cardItem == nil {
            self.cardItem = CardItem(
                card: card,
                difficultyDelegate: difficultyDelegate,
                indexPath: indexPath
            )
            self.addSubview(cardItem!)
            NSLayoutConstraint.activate([
                cardItem!.topAnchor.constraint(equalTo: topAnchor),
                cardItem!.leadingAnchor.constraint(equalTo: leadingAnchor),
                cardItem!.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        } else {
            self.cardItem?.updateData(card: card, indexPath: indexPath)
        }
    }
    
    func bind(card: Card, indexPath: IndexPath?) {
        if cardItem == nil {
            self.cardItem = CardItem(
                card: card,
                indexPath: indexPath
            )
            self.addSubview(cardItem!)
            NSLayoutConstraint.activate([
                cardItem!.topAnchor.constraint(equalTo: topAnchor),
                cardItem!.leadingAnchor.constraint(equalTo: leadingAnchor),
                cardItem!.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        } else {
            self.cardItem?.updateData(card: card, indexPath: indexPath)
        }
    }
}
