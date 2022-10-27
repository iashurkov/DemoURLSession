//
//  DetailInformationRouter.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

protocol DetailInformationRouterInput: AnyObject {
    func closeModule()
}

final class DetailInformationRouter {
    
    weak var view: Routable?
    
    // MARK: Init
    
    init() {
        print("INIT : ✅ : DetailInformationRouter")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : DetailInformationRouter")
    }
}

// MARK: - DetailInformationRouterInput

extension DetailInformationRouter: DetailInformationRouterInput {
    
    func closeModule() {
        self.view?.dismissModule()
    }
}
