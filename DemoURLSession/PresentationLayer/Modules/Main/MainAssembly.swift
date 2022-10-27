//
//  MainAssembly.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

final class MainAssembly {
    
    private let serviceLocator: ServiceLocating
    
    // MARK: Init
    
    init(serviceLocator: ServiceLocating) {
        self.serviceLocator = serviceLocator
        print("INIT : ✅ : MainAssembly")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : MainAssembly")
    }
}

// MARK: - Assembly

extension MainAssembly: Assembly {
    
    func configureModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        let router = MainRouter(serviceLocator: self.serviceLocator)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view.wrappedInNavigationController()
    }
}
