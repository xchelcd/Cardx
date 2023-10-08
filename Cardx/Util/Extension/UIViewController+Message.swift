//
//  UIViewController+Message.swift
//  Cardx
//
//  Created by Xchel Carranza on 08/10/23.
//

import UIKit

extension UIViewController {
    func displayMessage(_ controller: UIView, message: String) {
        print("UIViewController", "message: \(message)")
        removeMessageLabel()
        let messageLabel = createLabel()
        setMessageLabelOnView(view, messageLabel)
        messageLabel.text = message
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.removeMessageLabel()
            print("UIViewController", "Label deleted")
        }
    }
    
    private func setMessageLabelOnView(_ view: UIView, _ label: UILabel) {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.tag = 942
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func removeMessageLabel() {
        let view = self.view.subviews.filter({ findLabel(view: $0) }).first
        view?.removeFromSuperview()
    }
    
    private func findLabel(view: UIView) -> Bool {
        view.tag == 942
    }
}
