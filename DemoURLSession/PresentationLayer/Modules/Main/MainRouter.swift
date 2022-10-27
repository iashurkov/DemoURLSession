//
//  MainRouter.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

protocol MainRouterInput: AnyObject {
    func openPresentedModule()
}

final class MainRouter {
    
    weak var view: Routable?
    
    private let serviceLocator: ServiceLocating
    
    // MARK: Init
    
    init(serviceLocator: ServiceLocating) {
        self.serviceLocator = serviceLocator
        print("INIT : ✅ : MainRouter")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : MainRouter")
    }
}

// MARK: - MainRouterInput

extension MainRouter: MainRouterInput {
    
    func openPresentedModule() {
        guard let presentedAssembly = self.serviceLocator.resolve(DetailInformationAssembly.self) else { fatalError() }
        
        let presentedViewController = presentedAssembly.configureModule()
        self.view?.present(presentedViewController, modalPresentationStyle: .formSheet)
    }
}
