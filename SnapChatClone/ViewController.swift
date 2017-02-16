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
    var profile: ProfileViewController!
    var selfie: SelfieViewController!
    
    var didLayoutControllers = false
    
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
        addProfileViewController()
        
        // Prepare top bar
        prepareTopBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Layout controller if this is the first time we show them
        if !didLayoutControllers {
            didLayoutControllers = true
            layoutControllers()
        }
    }

}

extension ViewController {
    
    fileprivate func showSelfieViewController() {
        
        // Get access to the selfie storyboard 
        selfie = UIStoryboard(name: "Selfie", bundle: nil).instantiateViewController(withIdentifier: "selfieViewController") as! SelfieViewController
        addAndShowChildViewController(selfie, container: self.view, animation: nil)
        
        // We want it to be behind the scroll view so bring the scroll view to the front
        view.insertSubview(selfie.view, belowSubview: scrollView)
    }
    
    fileprivate func addProfileViewController() {
        profile = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        addAndShowChildViewController(profile, container: scrollView, animation: nil)
    }
    
    fileprivate func prepareTopBar() {
        
        // Clear color
        topBar.setBackgroundImage(nil, for: .default)
        
        // Extra height
        topBar.frame.size.height = 64.0
    }
    
    fileprivate func layoutControllers() {
        
        // Adjust content size to fit controllers
        let pageSize = CGSize(width: scrollView.bounds.size.width, height: scrollView.bounds.size.height)
        let contentSize = CGSize(width: pageSize.width, height: pageSize.height*2)
        scrollView.contentSize = contentSize
        
        // Position controllers
        profile.view.frame.origin.y = 0.0
        
        // Set scroll view starting point
        scrollView.contentOffset = CGPoint(x: 0.0, y: pageSize.height)
    }
    
}
