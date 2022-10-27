//
//  ExtUIVewController.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

extension UIViewController: Routable {}

extension UIViewController {
    
    func wrappedInNavigationController(prefersLargeTitles: Bool = true) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: self)
        navigationController.navigationBar.tintColor = UIColor.systemBlue
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController.navigationBar.titleTextAttributes = attributes
        navigationController.navigationBar.prefersLargeTitles = prefersLargeTitles
        if prefersLargeTitles {
            navigationController.navigationBar.largeTitleTextAttributes = attributes
        }
        return navigationController
    }
}
