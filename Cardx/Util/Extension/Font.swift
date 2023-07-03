//
//  Font.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

extension UIButton {
    func setFontSize(fontSize: Int = 12) {
        self.titleLabel?.font = .systemFont(ofSize: CGFloat(fontSize))
        self.titleLabel?.numberOfLines = 1
    }
}
extension UITextField {
    func setFontSize(fontSize: Int = 15) {
        self.font = .systemFont(ofSize: CGFloat(fontSize))
    }
}
