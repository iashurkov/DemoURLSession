//
//  Assembly.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

protocol Assembly: AnyObject {
    func configureModule() -> UIViewController
    func configureModule(with model: TrackModel) -> UIViewController
}

extension Assembly {
    
    func configureModule() -> UIViewController {
        UIViewController()
    }
    
    func configureModule(with model: TrackModel) -> UIViewController {
        UIViewController()
    }
}
