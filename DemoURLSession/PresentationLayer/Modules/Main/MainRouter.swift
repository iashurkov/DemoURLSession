//
//  MainRouter.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

protocol MainRouterInput: AnyObject {
    func openPresentedModule(with model: TrackModel)
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
    
    func openPresentedModule(with model: TrackModel) {
        guard let detailInformationAssembly = self.serviceLocator.resolve(DetailInformationAssembly.self) else { fatalError() }
        
        let pushedViewController = detailInformationAssembly.configureModule(with: model)
        self.view?.push(pushedViewController)
    }
}
