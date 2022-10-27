//
//  PresentedService.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

protocol PresentedService: AnyObject {}

final class PresentedServiceImp {
    
    // MARK: Init
    
    init() {
        print("INIT : ✅ : PresentedService")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : PresentedService")
    }
}

// MARK: - PresentedService

extension PresentedServiceImp: PresentedService {
    
}
