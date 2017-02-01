//
//  UIViewController.swift
//  SnapChatClone
//
//  Created by Haider Khan on 2/1/17.
//  Copyright © 2017 ZkHaider. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /*
     Adds childController to the controller hierarchy and at the same time adds, and optionally animates, the child view
     @param animation: Closure to execute some animation. It receives the container view, the child view and a completion closure to call when animation is completed
     */
    public func addAndShowChildViewController(_ childController: UIViewController, container: UIView?, animation: ((UIView, UIView, @escaping (Bool) -> ()) ->())?) {
        addChildViewController(childController)
        childController.view.frame = view.bounds
        view.addSubview(childController.view)
        let containerView: UIView = container ?? view
        if animation != nil {
            animation?(containerView, childController.view, { (finished: Bool) in
                childController.didMove(toParentViewController: self)
            })
        } else {
            childController.didMove(toParentViewController: self)
        }
    }
    
    public func addAndFadeInChildViewController(_ childController: UIViewController, container: UIView?) {
        addAndShowChildViewController(childController, container: container) { (container: UIView, childView: UIView, completion: @escaping (Bool)->()) in
            // Fade in
            childView.alpha = 0.0
            UIView.animate(withDuration: 0.3, animations: {
                childView.alpha = 1.0
            }, completion: completion)
        }
    }
    
    public func dismissAndRemoveChildViewController(_ childController: UIViewController, animation: ((UIView, @escaping (Bool) -> ()) ->())?) {
        childController.willMove(toParentViewController: nil)
        if animation != nil {
            animation?(childController.view, { (finished: Bool) in
                childController.view.removeFromSuperview()
                childController.removeFromParentViewController()
            })
        } else {
            childController.view.removeFromSuperview()
            childController.removeFromParentViewController()
        }
    }
    
    public func fadeOutAndRemoveChildViewController(_ childController: UIViewController) {
        dismissAndRemoveChildViewController(childController) { (childView: UIView, completion: @escaping (Bool)->()) in
            // Fade out
            UIView.animate(withDuration: 0.3, animations: {
                childView.alpha = 0.0
            }, completion: completion)
        }
    }
}
