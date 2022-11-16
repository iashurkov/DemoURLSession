//
//  TrackCell.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

final class TrackCell: UITableViewCell {
    
    // MARK: Private properties
    
    private var model: TrackModel?
    
    private enum Constants {
        static let spaceForTitle: CGFloat = 16
        static let sizeFontForTitle: CGFloat = 17
        
        static let separatorHeight: CGFloat = 1
    }
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.black.withAlphaComponent(0.3)
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: Constants.sizeFontForTitle)
        label.numberOfLines = 2
        label.textColor = Colors.black
        
        return label
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: nil)
        
        self.drawSelf()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.drawSelf()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = nil
    }
    
    // MARK: Drawing
    
    private func drawSelf() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.addSubview(self.separatorView)
        self.addSubview(self.titleLabel)
        
        let constraintsForSeparatorView = self.constraintsForSeparatorView()
        let constraintsForTitleLabel = self.constraintsForTitleLabel()
        
        NSLayoutConstraint.activate(
            constraintsForSeparatorView +
            constraintsForTitleLabel
        )
    }
    
    // MARK: Get NSLayoutConstraints
    
    private func constraintsForSeparatorView() -> [NSLayoutConstraint] {
        let topAnchor = self.separatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let leadingAnchor = self.separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailingAnchor = self.separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let heightAnchor = self.separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight)
        
        return [
            topAnchor, leadingAnchor, trailingAnchor, heightAnchor
        ]
    }
    
    private func constraintsForTitleLabel() -> [NSLayoutConstraint] {
        let centerYAnchor = self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let leadingAnchor = self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.spaceForTitle)
        let trailingAnchor = self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.spaceForTitle)
        
        return [
            centerYAnchor, leadingAnchor, trailingAnchor
        ]
    }
    
    // MARK: Public methods
    
    func setup(with model: TrackModel) {
        self.model = model
        
        self.titleLabel.text = model.name ?? "Unknown"
    }
}
