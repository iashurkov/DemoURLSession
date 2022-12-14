//
//  MainPresenter.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

protocol MainViewOutput: ViewOutput {
    func openPresentedModule(with model: TrackModel)
}

final class MainPresenter {
    
    // MARK: Public Properties
    
    weak var view: MainViewInput?
    var interactor: MainInteractorInput?
    var router: MainRouterInput?
    
    // MARK: Private Properties
    
    private var models: TrackModels?
    
    // MARK: Init
    
    init() {
        print("INIT : ✅ : MainPresenter")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : MainPresenter")
    }
}

// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {
    
    func viewDidLoad() {
        self.interactor?.obtainData()
    }
    
    func openPresentedModule(with model: TrackModel) {
        self.router?.openPresentedModule(with: model)
    }
}

// MARK: - MainInteractorOutput

extension MainPresenter: MainInteractorOutput {
    
    func updateView(with models: TrackModels) {
        self.models = models
        self.view?.updateView(with: models)
    }
}
