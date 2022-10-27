//
//  MainViewController.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

protocol MainViewInput: AnyObject {
}

final class MainViewController: UIViewController {
    
    // MARK: Public Properties
    
    var presenter: MainViewOutput?
    
    // MARK: Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("INIT : ✅ : MainViewController")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : MainViewController")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
    }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {
    
}
