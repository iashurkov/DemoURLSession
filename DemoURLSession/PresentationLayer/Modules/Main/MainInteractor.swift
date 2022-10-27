//
//  MainInteractor.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

protocol MainInteractorInput {
}

protocol MainInteractorOutput: AnyObject {
}

final class MainInteractor {
    
    // MARK: Public Properties
    
    weak var presenter: MainInteractorOutput?
    
    // MARK: Init
    
    init() {
        print("INIT : ✅ : MainInteractor")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : MainInteractor")
    }
}

// MARK: - MainInteractorInput

extension MainInteractor: MainInteractorInput {
    
}
