//
//  DetailInformationInteractor.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

protocol DetailInformationInteractorInput {
}

protocol DetailInformationInteractorOutput: AnyObject {
}

final class DetailInformationInteractor {
    
    // MARK: Public Properties
    
    weak var presenter: DetailInformationInteractorOutput?
    
    // MARK: Init
    
    init() {
        print("INIT : ✅ : DetailInformationInteractor")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : DetailInformationInteractor")
    }
}

// MARK: - DetailInformationInteractorInput

extension DetailInformationInteractor: DetailInformationInteractorInput {
    
}
