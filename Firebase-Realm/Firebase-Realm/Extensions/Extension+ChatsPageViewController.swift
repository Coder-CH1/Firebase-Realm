//
//  Extension+ChatsPageViewController.swift
//  Firebase-Realm
//
//  Created by Mac on 18/05/2023.
//

import Foundation
import UIKit

extension ChatsPageViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return BottomSheetPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
