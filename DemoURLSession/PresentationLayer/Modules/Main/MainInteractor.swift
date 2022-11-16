//
//  MainInteractor.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

protocol MainInteractorInput {
    func obtainData()
}

protocol MainInteractorOutput: AnyObject {
    func updateView(with models: TrackModels)
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
    
    func obtainData() {
        if let url = Bundle.main.url(forResource: "mockData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let models = try decoder.decode(TrackModels.self, from: data)
                
                self.presenter?.updateView(with: models)
            } catch {
                print("❗️ERROR : \(error)")
            }
        }
    }
}
