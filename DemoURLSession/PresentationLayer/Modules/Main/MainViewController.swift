//
//  MainViewController.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

protocol MainViewInput: AnyObject {
    func updateView(with models: TrackModels)
}

final class MainViewController: UIViewController {
    
    // MARK: Public Properties
    
    var presenter: MainViewOutput?
    
    // MARK: Private Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(cellTypes: [TrackCell.self])
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.rowHeight = UITableView.automaticDimension
        
        return tableView
    }()
    
    private var model: TrackModels?
    
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
        self.view.backgroundColor = Colors.gray
        
        self.setupNavigationBar()
        self.drawSelf()
        
        self.presenter?.viewDidLoad()
    }
    
    // MARK: Drawing
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Main"
    }
    
    private func drawSelf() {
        self.view.addSubview(self.tableView)
        
        let constraintsForTableView = self.constraintsForTableView()
        
        NSLayoutConstraint.activate(
            constraintsForTableView
        )
    }
    
    // MARK: Get NSLayoutConstraints
    
    private func constraintsForTableView() -> [NSLayoutConstraint] {
        let topAnchor = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let trailingAnchor = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let leadingAnchor = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let bottomAnchor = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        return [
            topAnchor, trailingAnchor, leadingAnchor, bottomAnchor
        ]
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.result.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TrackCell = tableView.dequeueReusableCell(for: indexPath)
        
        if let model = self.model?.result[indexPath.row] {
            cell.setup(with: model)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("[ ## ] User selected cell with id = \(indexPath.row)")
    }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {
    
    func updateView(with models: TrackModels) {
        print("[ ## ] Update view controller with models ...")
        
        self.model = models
    }
}
