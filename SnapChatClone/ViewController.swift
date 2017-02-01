//
//  ViewController.swift
//  SnapChatClone
//
//  Created by Haider Khan on 2/1/17.
//  Copyright © 2017 ZkHaider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*********************************************************************************************
     *  LifeCycle Methods
     *********************************************************************************************/

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}

extension ViewController {
    
    fileprivate func showSelfieViewController() {
        
        // Get access to the selfie storyboard 
        let selfieViewController = UIStoryboard(name: "Selfie", bundle: nil).instantiateViewController(withIdentifier: "selfieViewController") as! SelfieViewController
        
    }
    
}
