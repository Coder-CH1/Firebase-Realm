//
//  BottomSheet.swift
//  Firebase-Realm
//
//  Created by Mac on 18/05/2023.
//

import Foundation
import UIKit

class BottomSheetPresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        
        let height: CGFloat = 300
        
        let frame = CGRect(x: 0, y: containerView.bounds.height - height, width: containerView.bounds.width, height: height)
        return frame
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        containerView?.backgroundColor = .clear
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        guard let containerView = containerView else { return }
        
        let dimmingView = UIView(frame: containerView.bounds)
        dimmingView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        dimmingView.alpha = 0
        containerView.insertSubview(dimmingView, at: 0)
        
        let cancelButton = UIButton(type: .system)
        cancelButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        cancelButton.tintColor = .white
        cancelButton.frame = CGRect(x: containerView.bounds.width - 100, y: containerView.bounds.height - frameOfPresentedViewInContainerView.height - 50, width: 100, height: 30)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        containerView.addSubview(cancelButton)
        
        presentingViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            dimmingView.alpha = 1
        }, completion: nil)
    }
    
    @objc func cancelButtonTapped() {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
}

