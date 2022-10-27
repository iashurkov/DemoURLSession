//
//  DetailInformationPresenter.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

protocol DetailInformationViewOutput: AnyObject {
    func closeModule()
}

final class DetailInformationPresenter {
    
    // MARK: Public Properties
    
    weak var view: DetailInformationViewInput?
    var interactor: DetailInformationInteractorInput?
    var router: DetailInformationRouterInput?
    
    // MARK: Init
    
    init() {
        print("INIT : ✅ : DetailInformationPresenter")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : DetailInformationPresenter")
    }
}

// MARK: - DetailInformationViewOutput

extension DetailInformationPresenter: DetailInformationViewOutput {
    
    func closeModule() {
        self.router?.closeModule()
    }
}

// MARK: - DetailInformationInteractorOutput

extension DetailInformationPresenter: DetailInformationInteractorOutput {
    
}
