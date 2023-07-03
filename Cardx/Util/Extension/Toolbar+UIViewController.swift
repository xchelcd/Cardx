//
//  Toolbar+UIViewController.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit


extension UIViewController {
    
    func setupToolbar(title: String, largeTitle: Bool = true) {
        self.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = largeTitle
    }
}
