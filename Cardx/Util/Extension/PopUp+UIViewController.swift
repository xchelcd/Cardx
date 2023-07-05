//
//  PopUp+UIViewController.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import UIKit

extension UIViewController {
    
    func showDefaultPopUpToAdd(title: String, message: String, placeholder: String, itemAdded: ((String?) -> Void)? = nil) {
        let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
        popUp.addTextField { textField in
            textField.placeholder = placeholder
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { _ in
            self.dismiss(animated: true)
        })
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { [weak popUp] (_) in
            guard let textField = popUp?.textFields?.first else {
                itemAdded?(nil)
                return
            }
            itemAdded?(textField.text)
        })
        
        popUp.addAction(cancelAction)
        
        popUp.addAction(addAction)
        
        self.present(popUp, animated: true)
    }
}
