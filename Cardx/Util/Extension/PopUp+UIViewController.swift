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
    
    func showDefaultActionCompletedBottomSheet(title: String = "Action completed successfully", message: String = "The actions that you did was completed successfully!") {
        let bottomSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let closeAction = UIAlertAction(title: "Ok", style: .cancel)
        bottomSheet.addAction(closeAction)
        
        present(bottomSheet, animated: true)
    }
}
