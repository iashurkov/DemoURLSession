//
//  DetailInformationPresenter.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

protocol DetailInformationViewOutput: ViewOutput {
    func closeModule()
}

final class DetailInformationPresenter {
    
    // MARK: Public Properties
    
    weak var view: DetailInformationViewInput?
    var interactor: DetailInformationInteractorInput?
    var router: DetailInformationRouterInput?
    
    // MARK: Private Properties
    
    private let model: TrackModel
    
    // MARK: Init
    
    init(model: TrackModel) {
        print("INIT : ✅ : DetailInformationPresenter")
        
        self.model = model
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : DetailInformationPresenter")
    }
}

// MARK: - DetailInformationViewOutput

extension DetailInformationPresenter: DetailInformationViewOutput {
    
    func viewDidLoad() {
        self.view?.didObtainView(with: self.model)
    }
    
    func closeModule() {
        self.router?.closeModule()
    }
}

// MARK: - DetailInformationInteractorOutput

extension DetailInformationPresenter: DetailInformationInteractorOutput {
    
}
