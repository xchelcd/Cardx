//
//  UITextField+Toolbar.swift
//  Cardx
//
//  Created by Xchel Carranza on 07/10/23.
//

import UIKit

extension UITextField {
    func setDoneButton() -> UIToolbar {
        let toolbar = UIToolbar()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                         target: self, action: #selector(doneButtonTapped))
        
        toolbar.setItems([flexSpace, doneButton], animated: true)
        toolbar.sizeToFit()
        return toolbar
    }
    
    @objc func doneButtonTapped() {
        self.endEditing(true)
    }
}
