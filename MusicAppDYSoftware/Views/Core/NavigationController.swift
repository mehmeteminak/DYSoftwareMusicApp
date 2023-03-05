//
//  NavigationController.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 5.03.2023.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchVC = SearchVC()
        
        setViewControllers([searchVC], animated: true)
        
    }
    
}
