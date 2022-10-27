//
//  Routable.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

protocol Routable where Self: UIViewController {
    func present(_ view: UIViewController,
                 modalPresentationStyle: UIModalPresentationStyle,
                 animated: Bool,
                 completion: (() -> Void)?)
    func push(_ view: UIViewController, animated: Bool)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func popModule(animated: Bool)
    func popToRootModule(animated: Bool)
}

extension Routable {
    
    func present(_ view: UIViewController,
                 modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                 animated: Bool = true,
                 completion: (() -> Void)? = nil) {
        view.modalPresentationStyle = modalPresentationStyle
        self.present(view, animated: animated, completion: completion)
    }
    
    func push(_ view: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(view, animated: animated)
    }
    
    func dismissModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.dismiss(animated: animated, completion: completion)
    }
    
    func popModule(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    func popToRootModule(animated: Bool = true) {
        self.navigationController?.popToRootViewController(animated: animated)
    }
}
