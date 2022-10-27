//
//  PushedService.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

protocol PushedService: AnyObject {}

final class PushedServiceImp {
    
    // MARK: Init
    
    init() {
        print("INIT : ✅ : PushedService")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : PushedService")
    }
}

// MARK: - PushedService

extension PushedServiceImp: PushedService {
    
}
