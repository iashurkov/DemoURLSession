//
//  DetailInformationAssembly.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

final class DetailInformationAssembly {
    
    private let serviceLocator: ServiceLocating
    
    // MARK: Init
    
    init(serviceLocator: ServiceLocating) {
        self.serviceLocator = serviceLocator
        print("INIT : ✅ : DetailInformationAssembly")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : DetailInformationAssembly")
    }
}

// MARK: - Assembly

extension DetailInformationAssembly: Assembly {
    
    func configureModule(with model: TrackModel) -> UIViewController {
        let view = DetailInformationViewController()
        let presenter = DetailInformationPresenter(model: model)
        let interactor = DetailInformationInteractor()
        let router = DetailInformationRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}
