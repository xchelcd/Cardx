//
//  Blur+UIViewController.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import UIKit

extension UIViewController {
    
    private func makeBlurEffectView() -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.tag = 4313
        blurEffectView.alpha = 0.75
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return blurEffectView
    }
    
    func showBlurEffect() {
        let blurView = makeBlurEffectView()
        self.view.addSubview(blurView)
    }
    
    func removeBlurEffect() {
        let view = self.view.subviews.filter({ findBlurView(view: $0) })[0]
        view.removeFromSuperview()
    }
    
    private func findBlurView(view: UIView) -> Bool {
        view.tag == 4313
    }
}
