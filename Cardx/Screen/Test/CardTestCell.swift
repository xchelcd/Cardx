//
//  CardTestCell.swift
//  Cardx
//
//  Created by Xchel Carranza on 04/07/23.
//

import UIKit

class TestCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func bind(card: Card) {
        let cardItem = CardItem(card: card)
        self.addSubview(cardItem)
        NSLayoutConstraint.activate([
            cardItem.topAnchor.constraint(equalTo: topAnchor),
            cardItem.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardItem.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
