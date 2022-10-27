//
//  MainPresenter.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

protocol MainViewOutput: AnyObject {
    func openPresentedModule()
}

final class MainPresenter {
    
    // MARK: Public Properties
    
    weak var view: MainViewInput?
    var interactor: MainInteractorInput?
    var router: MainRouterInput?
    
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
    
    func openPresentedModule() {
        self.router?.openPresentedModule()
    }
}

// MARK: - MainInteractorOutput

extension MainPresenter: MainInteractorOutput {
    
}
