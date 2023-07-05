//
//  NameDescribable.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

protocol NameDescribable {
    var _tag: String { get }
    static var _tag: String { get }
}

extension NameDescribable {
    var _tag: String {
        return "[ \(String(describing: type(of: self))) ]"
    }

    static var _tag: String {
        return "[ \(String(describing: self)) ]"
    }
}

extension UIViewController: NameDescribable {}
extension UIView: NameDescribable {}
extension CoreDataManager: NameDescribable {}
extension AppDelegate: NameDescribable {}
extension ViewModel: NameDescribable {}
