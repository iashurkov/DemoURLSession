//
//  NSObject.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import Foundation

extension NSObject {
    
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return String(describing: type(of: self))
    }
}
