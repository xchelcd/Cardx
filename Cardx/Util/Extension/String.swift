//
//  String.swift
//  Cardx
//
//  Created by Xchel Carranza on 13/10/23.
//

import UIKit

extension String {

    var underLined: NSAttributedString {
        NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }

}
