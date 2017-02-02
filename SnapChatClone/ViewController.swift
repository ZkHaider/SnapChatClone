//
//  ViewController.swift
//  SnapChatClone
//
//  Created by Haider Khan on 2/1/17.
//  Copyright © 2017 ZkHaider. All rights reserved.
//

import UIKit

enum Section {
    case conversations
    case selfie
    case stories
}

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topBar: UINavigationBar!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /*********************************************************************************************
     *  LifeCycle Methods
     *********************************************************************************************/

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show our selfie view controller because it is the main screen
        showSelfieViewController()
        
        // Prepare top bar
        prepareTopBar()
    }

}

extension ViewController {
    
    fileprivate func showSelfieViewController() {
        
        // Get access to the selfie storyboard 
        let selfieViewController = UIStoryboard(name: "Selfie", bundle: nil).instantiateViewController(withIdentifier: "selfieViewController") as! SelfieViewController
        addAndShowChildViewController(selfieViewController, container: self.view, animation: nil)
        
        // We want it to be behind the scroll view so bring the scroll view to the front
        view.insertSubview(selfieViewController.view, belowSubview: scrollView)
    }
    
    fileprivate func prepareTopBar() {
        
        // Clear color
        topBar.setBackgroundImage(nil, for: .default)
        
        // Extra height
        var frame = topBar.frame
        frame.size.height = 64.0
        topBar.frame = frame
    }
    
}
