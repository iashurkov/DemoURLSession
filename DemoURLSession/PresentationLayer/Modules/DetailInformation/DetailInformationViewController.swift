//
//  DetailInformationViewController.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

protocol DetailInformationViewInput: AnyObject {
}

final class DetailInformationViewController: UIViewController {
    
    // MARK: Public Properties
    
    var presenter: DetailInformationViewOutput?
    
    // MARK: Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("INIT : ✅ : DetailInformationViewController")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : DetailInformationViewController")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - DetailInformationViewInput

extension DetailInformationViewController: DetailInformationViewInput {
    
}
